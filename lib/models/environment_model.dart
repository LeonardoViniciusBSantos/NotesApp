import 'category_model.dart';

class Environment {
  final String id;
  String name;
  String photoUrl;
  String description;
  List<Category> categories;

  Environment({
    required this.id,
    required this.name,
    required this.photoUrl,
    required this.description,
    required this.categories,
  });
}
