import 'item_model.dart';

class Category {
  final String id;
  String name;
  String photoUrl;
  String description;
  List<Item> items;

  Category({
    required this.id,
    required this.name,
    required this.photoUrl,
    required this.description,
    required this.items,
  });
}
