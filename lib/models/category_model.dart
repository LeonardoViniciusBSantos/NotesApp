import 'package:cloud_firestore/cloud_firestore.dart';
import 'item_model.dart';

class Category {
  String id;
  String name;
  String description;
  String photoUrl;
  List<Item> items;

  Category({
    required this.id,
    required this.name,
    required this.description,
    required this.photoUrl,
    required this.items,
  });

  factory Category.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Category(
      id: doc.id,
      name: data['name'] ?? '',
      description: data['description'] ?? '',
      photoUrl: data['photoUrl'] ?? '',
      items: (data['items'] as List<dynamic>).map((itemData) {
        return Item.fromMap(itemData as Map<String, dynamic>);
      }).toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'photoUrl': photoUrl,
      'items': items.map((item) => item.toMap()).toList(),
    };
  }

  static Future<void> createCategory(
      String environmentId, Category category) async {
    try {
      if (environmentId.isEmpty) {
        throw ArgumentError("environmentId is empty");
      }

      final collection = FirebaseFirestore.instance
          .collection('environments')
          .doc(environmentId)
          .collection('categories');

      await collection.add(category.toMap());
      print("Category created successfully");
    } catch (e) {
      print("Error creating category: $e");
    }
  }

  static Future<Category?> readCategory(
      String environmentId, String categoryId) async {
    final doc = await FirebaseFirestore.instance
        .collection('environments')
        .doc(environmentId)
        .collection('categories')
        .doc(categoryId)
        .get();
    if (doc.exists) {
      return Category.fromDocument(doc);
    }
    return null;
  }

  Future<void> updateCategory(String environmentId) async {
    final collection = FirebaseFirestore.instance
        .collection('environments')
        .doc(environmentId)
        .collection('categories');
    await collection.doc(id).update(toMap());
  }

  static Future<void> deleteCategory(
      String environmentId, String categoryId) async {
    final collection = FirebaseFirestore.instance
        .collection('environments')
        .doc(environmentId)
        .collection('categories');
    await collection.doc(categoryId).delete();
  }

  static Future<List<Category>> listCategories(String environmentId) async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('environments')
        .doc(environmentId)
        .collection('categories')
        .get();
    return querySnapshot.docs.map((doc) => Category.fromDocument(doc)).toList();
  }
}
