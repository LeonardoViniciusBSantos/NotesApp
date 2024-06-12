import 'package:flutter/material.dart';
import '../models/category_model.dart';

class CategoryFormScreen extends StatefulWidget {
  final String environmentId;
  final Category? category;
  final Function(Category) onCategoryCreated;

  CategoryFormScreen({
    required this.environmentId,
    this.category,
    required this.onCategoryCreated,
  });

  @override
  _CategoryFormScreenState createState() => _CategoryFormScreenState();
}

class _CategoryFormScreenState extends State<CategoryFormScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _description = '';

  @override
  void initState() {
    super.initState();
    print("environmentId in initState: ${widget.environmentId}");
    if (widget.category != null) {
      _name = widget.category!.name;
      _description = widget.category!.description;
    }
  }

  void _submitForm() {
    print("environmentId in _submitForm: ${widget.environmentId}");
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final category = Category(
        id: widget.category?.id ?? '',
        name: _name,
        description: _description,
        photoUrl: '',
        items: [],
      );

      if (widget.category == null) {
        Category.createCategory(widget.environmentId, category).then((_) {
          widget.onCategoryCreated(category);
          Navigator.pop(context);
        }).catchError((error) {
          print("Error creating category: $error");
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Erro ao criar categoria: $error')),
          );
        });
      } else {
        category.updateCategory(widget.environmentId).then((_) {
          widget.onCategoryCreated(category);
          Navigator.pop(context);
        }).catchError((error) {
          print("Error updating category: $error");
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Erro ao atualizar categoria: $error')),
          );
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category == null ? 'Add Category' : 'Edit Category'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                initialValue: _name,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value!;
                },
              ),
              TextFormField(
                initialValue: _description,
                decoration: InputDecoration(labelText: 'Description'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
                onSaved: (value) {
                  _description = value!;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text(widget.category == null ? 'Create' : 'Update'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
