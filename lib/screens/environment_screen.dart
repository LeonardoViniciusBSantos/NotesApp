import 'package:flutter/material.dart';
import 'package:notes_app/models/category_model.dart';
import 'package:notes_app/screens/list_item_screen.dart';
import '../models/environment_model.dart';
import '../widgets/category_card.dart';
import 'category_form_screen.dart';

class EnvironmentScreen extends StatelessWidget {
  final Environment environment;

  EnvironmentScreen({required this.environment});

  void _addCategory(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CategoryFormScreen(environment: environment),
      ),
    );
  }

  void _editCategory(BuildContext context, Category category) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            CategoryFormScreen(environment: environment, category: category),
      ),
    );
  }

  void _deleteCategory(Category category) {
    environment.categories.remove(category);
    // Notify the UI
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(environment.name),
      ),
      body: ListView.builder(
        itemCount: environment.categories.length,
        itemBuilder: (context, index) {
          final category = environment.categories[index];
          return CategoryCard(
            name: category.name,
            photoUrl: category.photoUrl,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoryItemsScreen(category: category),
                ),
              );
            },
            onEdit: () => _editCategory(context, category),
            onDelete: () => _deleteCategory(category),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addCategory(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
