import 'package:flutter/material.dart';
import '../models/environment_model.dart';
import '../mock_data/mock_environments.dart';

class EnvironmentFormScreen extends StatefulWidget {
  final Environment? environment;

  EnvironmentFormScreen({this.environment});

  @override
  _EnvironmentFormScreenState createState() => _EnvironmentFormScreenState();
}

class _EnvironmentFormScreenState extends State<EnvironmentFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _name;
  late String _description;
  late String _photoUrl;

  @override
  void initState() {
    super.initState();
    _name = widget.environment?.name ?? '';
    _description = widget.environment?.description ?? '';
    _photoUrl = widget.environment?.photoUrl ?? '';
  }

  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      if (widget.environment == null) {
        // Create a new environment
        mockEnvironments.add(Environment(
          id: '',
          name: _name,
          description: _description,
          photoUrl: _photoUrl,
          categories: [],
        ));
      } else {
        // Update existing environment
        setState(() {
          widget.environment!.name = _name;
          widget.environment!.description = _description;
          widget.environment!.photoUrl = _photoUrl;
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
            widget.environment == null ? 'Novo Ambiente' : 'Editar Ambiente'),
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
