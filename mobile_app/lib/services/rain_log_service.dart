import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/index.dart';

/// Rain Log Service - Firestore operations for rain logs
class RainLogService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Get rain logs collection reference
  CollectionReference _getRainLogsCollection() {
    return _firestore
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .collection('rainLogs');
  }

  /// Log rainfall
  Future<String> logRainfall(RainLogModel rainLog) async {
    try {
      final logData = rainLog.copyWith(
        createdAt: DateTime.now(),
      );

      final docRef = await _getRainLogsCollection()
          .add(logData.toJson());
      print('✅ Rain log created: ${docRef.id}');
      return docRef.id;
    } catch (e) {
      print('❌ Error logging rainfall: $e');
      rethrow;
    }
  }

  /// Get all rain logs
  Future<List<RainLogModel>> getAllRainLogs() async {
    try {
      final snapshot = await _getRainLogsCollection()
          .orderBy('date', descending: true)
          .limit(100)
          .get();

      return snapshot.docs
          .map((doc) => RainLogModel.fromJson({
                ...doc.data() as Map<String, dynamic>,
                'rainLogId': doc.id,
              }))
          .toList();
    } catch (e) {
      print('❌ Error fetching rain logs: $e');
      rethrow;
    }
  }

  /// Get rain logs by garden
  Future<List<RainLogModel>> getRainLogsByGarden(String gardenId) async {
    try {
      final snapshot = await _getRainLogsCollection()
          .where('gardenId', isEqualTo: gardenId)
          .orderBy('date', descending: true)
          .limit(50)
          .get();

      return snapshot.docs
          .map((doc) => RainLogModel.fromJson({
                ...doc.data() as Map<String, dynamic>,
                'rainLogId': doc.id,
              }))
          .toList();
    } catch (e) {
      print('❌ Error fetching garden rain logs: $e');
      rethrow;
    }
  }

  /// Stream recent rain logs (real-time)
  Stream<List<RainLogModel>> streamRecentRainLogs() {
    return _getRainLogsCollection()
        .orderBy('date', descending: true)
        .limit(20)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => RainLogModel.fromJson({
                  ...doc.data() as Map<String, dynamic>,
                  'rainLogId': doc.id,
                }))
            .toList());
  }

  /// Get monthly rainfall total
  Future<double> getMonthlyRainfall(String gardenId) async {
    try {
      final firstDayOfMonth = DateTime(
        DateTime.now().year,
        DateTime.now().month,
        1,
      );

      final snapshot = await _getRainLogsCollection()
          .where('gardenId', isEqualTo: gardenId)
          .where('date', isGreaterThanOrEqualTo: Timestamp.fromDate(firstDayOfMonth))
          .get();

      double total = 0;
      for (var doc in snapshot.docs) {
        total += (doc['rainfall'] ?? 0).toDouble();
      }

      return total;
    } catch (e) {
      print('❌ Error calculating monthly rainfall: $e');
      return 0;
    }
  }

  /// Get average daily rainfall this month
  Future<double> getAverageDailyRainfall(String gardenId) async {
    try {
      final firstDayOfMonth = DateTime(
        DateTime.now().year,
        DateTime.now().month,
        1,
      );

      final snapshot = await _getRainLogsCollection()
          .where('gardenId', isEqualTo: gardenId)
          .where('date', isGreaterThanOrEqualTo: Timestamp.fromDate(firstDayOfMonth))
          .get();

      if (snapshot.docs.isEmpty) return 0;

      double total = 0;
      for (var doc in snapshot.docs) {
        total += (doc['rainfall'] ?? 0).toDouble();
      }

      final daysInMonth = DateTime.now().day;
      return total / daysInMonth;
    } catch (e) {
      print('❌ Error calculating average daily rainfall: $e');
      return 0;
    }
  }

  /// Get rain logs with heavy rainfall (heavy or tropical storm)
  Future<List<RainLogModel>> getStormRains(String gardenId) async {
    try {
      final snapshot = await _getRainLogsCollection()
          .where('gardenId', isEqualTo: gardenId)
          .where('rainLevel', whereIn: ['heavy', 'tropical_storm'])
          .orderBy('date', descending: true)
          .get();

      return snapshot.docs
          .map((doc) => RainLogModel.fromJson({
                ...doc.data() as Map<String, dynamic>,
                'rainLogId': doc.id,
              }))
          .toList();
    } catch (e) {
      print('❌ Error fetching storm rains: $e');
      rethrow;
    }
  }
}
