import 'activity_model.dart';

class Item {
  final String id;
  String name;
  String description;
  List<Activity> activities;

  Item({
    required this.id,
    required this.name,
    required this.description,
    required this.activities,
  });
}
