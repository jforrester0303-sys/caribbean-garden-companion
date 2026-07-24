/// Notification Model
class NotificationModel {
  final String id;
  final String userId;
  final String type; // task_reminder, weather_alert, pest_warning, disease_warning, harvest_ready, etc
  final String category; // task, weather, pest_disease, harvest, milestone, community, system
  final String title;
  final String message;
  final NotificationData? data;
  final String? actionUrl;
  final bool read;
  final DateTime? readAt;
  final DateTime createdAt;
  final DateTime expiresAt;

  NotificationModel({
    required this.id,
    required this.userId,
    required this.type,
    required this.category,
    required this.title,
    required this.message,
    this.data,
    this.actionUrl,
    this.read = false,
    this.readAt,
    required this.createdAt,
    required this.expiresAt,
  });

  // Check if notification is expired
  bool get isExpired => DateTime.now().isAfter(expiresAt);

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'notificationId': id,
      'userId': userId,
      'type': type,
      'category': category,
      'title': title,
      'message': message,
      'data': data?.toJson(),
      'actionUrl': actionUrl,
      'read': read,
      'readAt': readAt?.toIso8601String(),
      'createdAt': createdAt.toIso8601String(),
      'expiresAt': expiresAt.toIso8601String(),
    };
  }

  // Create from JSON
  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['notificationId'] ?? '',
      userId: json['userId'] ?? '',
      type: json['type'] ?? 'system',
      category: json['category'] ?? 'system',
      title: json['title'] ?? '',
      message: json['message'] ?? '',
      data: json['data'] != null ? NotificationData.fromJson(json['data']) : null,
      actionUrl: json['actionUrl'],
      read: json['read'] ?? false,
      readAt: json['readAt'] != null ? DateTime.parse(json['readAt']) : null,
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : DateTime.now(),
      expiresAt: json['expiresAt'] != null
          ? DateTime.parse(json['expiresAt'])
          : DateTime.now().add(const Duration(days: 30)),
    );
  }

  // Copy with method
  NotificationModel copyWith({
    String? id,
    String? userId,
    String? type,
    String? category,
    String? title,
    String? message,
    NotificationData? data,
    String? actionUrl,
    bool? read,
    DateTime? readAt,
    DateTime? createdAt,
    DateTime? expiresAt,
  }) {
    return NotificationModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      type: type ?? this.type,
      category: category ?? this.category,
      title: title ?? this.title,
      message: message ?? this.message,
      data: data ?? this.data,
      actionUrl: actionUrl ?? this.actionUrl,
      read: read ?? this.read,
      readAt: readAt ?? this.readAt,
      createdAt: createdAt ?? this.createdAt,
      expiresAt: expiresAt ?? this.expiresAt,
    );
  }

  @override
  String toString() =>
      'NotificationModel(id: $id, type: $type, title: $title, read: $read)';
}

/// Notification Data Model
class NotificationData {
  final String? taskId;
  final String? plantId;
  final String? gardenId;
  final String? containerId;
  final Map<String, dynamic>? extras;

  NotificationData({
    this.taskId,
    this.plantId,
    this.gardenId,
    this.containerId,
    this.extras,
  });

  Map<String, dynamic> toJson() {
    return {
      'taskId': taskId,
      'plantId': plantId,
      'gardenId': gardenId,
      'containerId': containerId,
      'extras': extras,
    };
  }

  factory NotificationData.fromJson(Map<String, dynamic> json) {
    return NotificationData(
      taskId: json['taskId'],
      plantId: json['plantId'],
      gardenId: json['gardenId'],
      containerId: json['containerId'],
      extras: json['extras'],
    );
  }

  NotificationData copyWith({
    String? taskId,
    String? plantId,
    String? gardenId,
    String? containerId,
    Map<String, dynamic>? extras,
  }) {
    return NotificationData(
      taskId: taskId ?? this.taskId,
      plantId: plantId ?? this.plantId,
      gardenId: gardenId ?? this.gardenId,
      containerId: containerId ?? this.containerId,
      extras: extras ?? this.extras,
    );
  }
}

// Notification Type Options
const List<String> notificationTypes = [
  'task_reminder',
  'weather_alert',
  'pest_warning',
  'disease_warning',
  'harvest_ready',
  'watering_needed',
  'fertilizer_due',
  'milestone_achieved',
  'community_tip',
  'system_update',
];

// Notification Category Options
const List<String> notificationCategories = [
  'task',
  'weather',
  'pest_disease',
  'harvest',
  'milestone',
  'community',
  'system',
];
