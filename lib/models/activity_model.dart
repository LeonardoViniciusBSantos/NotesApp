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
}
