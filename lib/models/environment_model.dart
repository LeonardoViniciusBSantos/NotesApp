import 'package:cloud_firestore/cloud_firestore.dart';
import 'category_model.dart';

class Environment {
  String id;
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

  static Future<Environment> fromDocument(DocumentSnapshot doc) async {
    final data = doc.data() as Map<String, dynamic>;
    final environment = Environment(
      id: doc.id,
      name: data['name'] ?? '',
      photoUrl: data['photoUrl'] ?? '',
      description: data['description'] ?? '',
      categories: [],
    );

    // Buscar categorias da subcoleção 'categories'
    final categoryQuerySnapshot = await FirebaseFirestore.instance
        .collection('environments')
        .doc(environment.id)
        .collection('categories')
        .get();

    environment.categories = categoryQuerySnapshot.docs.map((categoryDoc) {
      return Category.fromDocument(categoryDoc);
    }).toList();

    return environment;
  }

  // Método para converter um objeto Environment para um mapa
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'photoUrl': photoUrl,
      // Remover 'categories' aqui, pois as categorias são salvas como subcoleções
    };
  }

  // Método para criar um novo environment
  Future<void> createEnvironment() async {
    await FirebaseFirestore.instance.collection('environments').add(toMap());
  }

  // Método para ler um environment pelo ID
  static Future<Environment?> readEnvironment(String id) async {
    final doc = await FirebaseFirestore.instance
        .collection('environments')
        .doc(id)
        .get();
    if (doc.exists) {
      return await Environment.fromDocument(doc);
    }
    return null;
  }

  // Método para atualizar um environment
  Future<void> updateEnvironment() async {
    await FirebaseFirestore.instance
        .collection('environments')
        .doc(id)
        .update(toMap());
  }

  // Método para deletar um environment
  Future<void> deleteEnvironment() async {
    await FirebaseFirestore.instance
        .collection('environments')
        .doc(id)
        .delete();
  }

  // Método para listar todos os environments
  static Future<List<Environment>> listEnvironments() async {
    final querySnapshot =
        await FirebaseFirestore.instance.collection('environments').get();
    return await Future.wait(querySnapshot.docs
        .map((doc) => Environment.fromDocument(doc))
        .toList());
  }
}
