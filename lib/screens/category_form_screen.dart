import 'package:flutter/material.dart';
import '../models/category_model.dart';
import '../models/environment_model.dart';

class CategoryFormScreen extends StatefulWidget {
  final Environment environment;
  final Category? category;

  CategoryFormScreen({required this.environment, this.category});

  @override
  _CategoryFormScreenState createState() => _CategoryFormScreenState();
}

class _CategoryFormScreenState extends State<CategoryFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _name;
  late String _description;
  late String _photoUrl;

  @override
  void initState() {
    super.initState();
    _name = widget.category?.name ?? '';
    _description = widget.category?.description ?? '';
    _photoUrl = widget.category?.photoUrl ?? '';
  }

  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      if (widget.category == null) {
        // Create a new category
        widget.environment.categories.add(Category(
          id: '',
          name: _name,
          description: _description,
          photoUrl: _photoUrl,
          items: [],
        ));
      } else {
        // Update existing category
        setState(() {
          widget.category!.name = _name;
          widget.category!.description = _description;
          widget.category!.photoUrl = _photoUrl;
        });
      }
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            widget.category == null ? 'Nova Categoria' : 'Editar Categoria'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                initialValue: _name,
                decoration: InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, insira um nome';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value!;
                },
              ),
              TextFormField(
                initialValue: _description,
                decoration: InputDecoration(labelText: 'Descrição'),
                onSaved: (value) {
                  _description = value!;
                },
              ),
              TextFormField(
                initialValue: _photoUrl,
                decoration: InputDecoration(labelText: 'URL da Foto'),
                onSaved: (value) {
                  _photoUrl = value!;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveForm,
                child: Text('Salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
