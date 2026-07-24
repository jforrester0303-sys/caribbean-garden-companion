import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/index.dart';

/// Water Log Service - Firestore operations for water logs
class WaterLogService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Get water logs collection reference
  CollectionReference _getWaterLogsCollection() {
    return _firestore
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .collection('waterLogs');
  }

  /// Log watering
  Future<String> logWatering(WaterLogModel waterLog) async {
    try {
      final logData = waterLog.copyWith(
        createdAt: DateTime.now(),
      );

      final docRef = await _getWaterLogsCollection()
          .add(logData.toJson());
      print('✅ Water log created: ${docRef.id}');
      return docRef.id;
    } catch (e) {
      print('❌ Error logging water: $e');
      rethrow;
    }
  }

  /// Get all water logs
  Future<List<WaterLogModel>> getAllWaterLogs() async {
    try {
      final snapshot = await _getWaterLogsCollection()
          .orderBy('date', descending: true)
          .limit(100)
          .get();

      return snapshot.docs
          .map((doc) => WaterLogModel.fromJson({
                ...doc.data() as Map<String, dynamic>,
                'waterLogId': doc.id,
              }))
          .toList();
    } catch (e) {
      print('❌ Error fetching water logs: $e');
      rethrow;
    }
  }

  /// Get water logs by garden
  Future<List<WaterLogModel>> getWaterLogsByGarden(String gardenId) async {
    try {
      final snapshot = await _getWaterLogsCollection()
          .where('gardenId', isEqualTo: gardenId)
          .orderBy('date', descending: true)
          .limit(50)
          .get();

      return snapshot.docs
          .map((doc) => WaterLogModel.fromJson({
                ...doc.data() as Map<String, dynamic>,
                'waterLogId': doc.id,
              }))
          .toList();
    } catch (e) {
      print('❌ Error fetching garden water logs: $e');
      rethrow;
    }
  }

  /// Get water logs by plant
  Future<List<WaterLogModel>> getWaterLogsByPlant(
    String gardenId,
    String plantId,
  ) async {
    try {
      final snapshot = await _getWaterLogsCollection()
          .where('gardenId', isEqualTo: gardenId)
          .where('plantId', isEqualTo: plantId)
          .orderBy('date', descending: true)
          .get();

      return snapshot.docs
          .map((doc) => WaterLogModel.fromJson({
                ...doc.data() as Map<String, dynamic>,
                'waterLogId': doc.id,
              }))
          .toList();
    } catch (e) {
      print('❌ Error fetching plant water logs: $e');
      rethrow;
    }
  }

  /// Stream recent water logs (real-time)
  Stream<List<WaterLogModel>> streamRecentWaterLogs() {
    return _getWaterLogsCollection()
        .orderBy('date', descending: true)
        .limit(20)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => WaterLogModel.fromJson({
                  ...doc.data() as Map<String, dynamic>,
                  'waterLogId': doc.id,
                }))
            .toList());
  }

  /// Get watering frequency for a plant
  Future<int> getWateringFrequencyDays(
    String gardenId,
    String plantId,
  ) async {
    try {
      final last7Days = DateTime.now().subtract(Duration(days: 7));
      
      final snapshot = await _getWaterLogsCollection()
          .where('gardenId', isEqualTo: gardenId)
          .where('plantId', isEqualTo: plantId)
          .where('date', isGreaterThan: Timestamp.fromDate(last7Days))
          .get();

      if (snapshot.docs.isEmpty) return 0;

      // Calculate average days between waterings
      final days = 7;
      final count = snapshot.docs.length;
      return (days / count).ceil();
    } catch (e) {
      print('❌ Error calculating watering frequency: $e');
      return 0;
    }
  }

  /// Get total water given to garden this month
  Future<double> getMonthlyWaterUsage(String gardenId) async {
    try {
      final firstDayOfMonth = DateTime(
        DateTime.now().year,
        DateTime.now().month,
        1,
      );

      final snapshot = await _getWaterLogsCollection()
          .where('gardenId', isEqualTo: gardenId)
          .where('date', isGreaterThanOrEqualTo: Timestamp.fromDate(firstDayOfMonth))
          .get();

      double total = 0;
      for (var doc in snapshot.docs) {
        total += (doc['waterAmount'] ?? 0).toDouble();
      }

      return total;
    } catch (e) {
      print('❌ Error calculating monthly water usage: $e');
      return 0;
    }
  }
}
