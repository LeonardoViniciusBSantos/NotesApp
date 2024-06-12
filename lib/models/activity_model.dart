import 'package:cloud_firestore/cloud_firestore.dart';

class Activity {
  final DateTime dateTime;
  final String user;
  final String name;
  final String description;
  final List<String> attachments;
  final List<String> comments;

  Activity({
    required this.dateTime,
    required this.user,
    required this.name,
    required this.description,
    required this.attachments,
    required this.comments,
  });

  factory Activity.fromMap(Map<String, dynamic> data) {
    return Activity(
      dateTime: (data['dateTime'] as Timestamp).toDate(),
      user: data['user'] ?? '',
      name: data['name'] ?? '',
      description: data['description'] ?? '',
      attachments: List<String>.from(data['attachments'] ?? []),
      comments: List<String>.from(data['comments'] ?? []),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'dateTime': Timestamp.fromDate(dateTime),
      'user': user,
      'name': name,
      'description': description,
      'attachments': attachments,
      'comments': comments,
    };
  }
}
