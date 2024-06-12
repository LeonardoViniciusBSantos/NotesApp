import 'package:flutter/material.dart';
import 'package:notes_app/screens/list_item_screen.dart';
import '../models/environment_model.dart';
import '../models/category_model.dart';
import 'category_form_screen.dart';
import '../widgets/category_card.dart';

class CategoryScreen extends StatefulWidget {
  final Environment environment;
  final String environmentId;

  CategoryScreen({required this.environment, required this.environmentId});

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  void _navigateToAddCategoryScreen(
      BuildContext context, String environmentId) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CategoryFormScreen(
          category: null, // Para adicionar uma nova categoria
          onCategoryCreated: (newCategory) {
            setState(() {
              widget.environment.categories.add(newCategory);
            });
          },
          environmentId: environmentId,
        ),
      ),
    );
  }

  void _navigateToEditCategoryScreen(BuildContext context, Category category) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CategoryFormScreen(
          category: category, // Para editar uma categoria existente
          onCategoryCreated: (editedCategory) {
            setState(() {
              final index = widget.environment.categories.indexOf(category);
              if (index != -1) {
                widget.environment.categories[index] = editedCategory;
              }
            });
          },
          environmentId: widget
              .environmentId, // Atualize aqui para passar o environmentId correto
        ),
      ),
    );
  }

  void _deleteCategory(Category category) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirmação"),
          content: Text("Você tem certeza que deseja excluir esta categoria?"),
          actions: <Widget>[
            TextButton(
              child: Text("Cancelar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("Excluir"),
              onPressed: () async {
                await Category.deleteCategory(
                    widget.environment.id, category.id);
                setState(() {
                  widget.environment.categories.remove(category);
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.environment.name),
      ),
      body: ListView.builder(
        itemCount: widget.environment.categories.length,
        itemBuilder: (context, index) {
          final category = widget.environment.categories[index];
          return CategoryCard(
            category: category,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ItemListScreen(
                          category: category,
                          environmentId: widget.environmentId,
                        )),
              );
            },
            onEdit: () => _navigateToEditCategoryScreen(context, category),
            onDelete: () => _deleteCategory(category),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            _navigateToAddCategoryScreen(context, widget.environment.id),
        child: Icon(Icons.add),
      ),
    );
  }
}
