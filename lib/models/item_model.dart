import 'package:cloud_firestore/cloud_firestore.dart';
import 'activity_model.dart';

class Item {
  String id;
  String name;
  String description;
  List<Activity> activities;

  Item({
    required this.id,
    required this.name,
    required this.description,
    required this.activities,
  });

  factory Item.fromMap(Map<String, dynamic> data) {
    return Item(
      id: data['id'] ?? '',
      name: data['name'] ?? '',
      description: data['description'] ?? '',
      activities: (data['activities'] as List<dynamic>).map((activityData) {
        return Activity.fromMap(activityData as Map<String, dynamic>);
      }).toList(),
    );
  }

  factory Item.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Item(
      id: doc.id,
      name: data['name'] ?? '',
      description: data['description'] ?? '',
      activities: (data['activities'] as List<dynamic>).map((activityData) {
        return Activity.fromMap(activityData as Map<String, dynamic>);
      }).toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'activities': activities.map((activity) => activity.toMap()).toList(),
    };
  }

  static Future<void> createItem(
      String environmentId, String categoryId, Item item) async {
    try {
      if (environmentId.isEmpty || categoryId.isEmpty) {
        throw ArgumentError("environmentId or categoryId is empty");
      }

      final collection = FirebaseFirestore.instance
          .collection('environments')
          .doc(environmentId)
          .collection('categories')
          .doc(categoryId)
          .collection('items');

      await collection.add(item.toMap());
      print("Item created successfully");
    } catch (e) {
      print("Error creating item: $e");
    }
  }

  Future<void> updateItem(String environmentId, String categoryId) async {
    final collection = FirebaseFirestore.instance
        .collection('environments')
        .doc(environmentId)
        .collection('categories')
        .doc(categoryId)
        .collection('items');
    await collection.doc(id).update(toMap());
  }

  static Future<void> deleteItem(
      String environmentId, String categoryId, String itemId) async {
    final collection = FirebaseFirestore.instance
        .collection('environments')
        .doc(environmentId)
        .collection('categories')
        .doc(categoryId)
        .collection('items');
    await collection.doc(itemId).delete();
  }

  static Future<List<Item>> listItems(
      String environmentId, String categoryId) async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('environments')
        .doc(environmentId)
        .collection('categories')
        .doc(categoryId)
        .collection('items')
        .get();
    return querySnapshot.docs.map((doc) => Item.fromDocument(doc)).toList();
  }

  static Future<void> createActivity(String environmentId, String categoryId,
      String itemId, Activity activity) async {
    try {
      final collection = FirebaseFirestore.instance
          .collection('environments')
          .doc(environmentId)
          .collection('categories')
          .doc(categoryId)
          .collection('items')
          .doc(itemId)
          .collection('activities');

      await collection.add(activity.toMap());
      print("Activity created successfully");
    } catch (e) {
      print("Error creating activity: $e");
    }
  }

  static Future<List<Activity>> listActivities(
      String environmentId, String categoryId, String itemId) async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('environments')
        .doc(environmentId)
        .collection('categories')
        .doc(categoryId)
        .collection('items')
        .doc(itemId)
        .collection('activities')
        .get();
    return querySnapshot.docs
        .map((doc) => Activity.fromMap(doc.data() as Map<String, dynamic>))
        .toList();
  }
}
