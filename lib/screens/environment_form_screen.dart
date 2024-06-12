import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/environment_model.dart';

class EnvironmentFormScreen extends StatefulWidget {
  final Environment? environment;

  EnvironmentFormScreen({this.environment});

  @override
  _EnvironmentFormScreenState createState() => _EnvironmentFormScreenState();
}

class _EnvironmentFormScreenState extends State<EnvironmentFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;
  late TextEditingController _photoUrlController;

  @override
  void initState() {
    super.initState();
    _nameController =
        TextEditingController(text: widget.environment?.name ?? '');
    _descriptionController =
        TextEditingController(text: widget.environment?.description ?? '');
    _photoUrlController =
        TextEditingController(text: widget.environment?.photoUrl ?? '');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _photoUrlController.dispose();
    super.dispose();
  }

  void _saveForm() async {
    if (_formKey.currentState!.validate()) {
      final name = _nameController.text;
      final description = _descriptionController.text;
      final photoUrl = _photoUrlController.text;

      if (widget.environment == null) {
        // Create a new environment
        final newEnvironment = Environment(
          id: '',
          name: name,
          description: description,
          photoUrl: photoUrl,
          categories: [],
        );
        await _createEnvironment(newEnvironment);
      } else {
        // Update existing environment
        widget.environment!.name = name;
        widget.environment!.description = description;
        widget.environment!.photoUrl = photoUrl;
        await _updateEnvironment(widget.environment!);
      }
      Navigator.of(context).pop();
    }
  }

  Future<void> _createEnvironment(Environment environment) async {
    final docRef = await FirebaseFirestore.instance
        .collection('environments')
        .add(environment.toMap());
    environment.id = docRef.id;
  }

  Future<void> _updateEnvironment(Environment environment) async {
    await FirebaseFirestore.instance
        .collection('environments')
        .doc(environment.id)
        .update(environment.toMap());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            widget.environment == null ? 'Novo Ambiente' : 'Editar Ambiente'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, insira um nome';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Descrição'),
              ),
              TextFormField(
                controller: _photoUrlController,
                decoration: InputDecoration(labelText: 'URL da Foto'),
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
