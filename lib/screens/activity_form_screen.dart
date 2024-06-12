import 'package:flutter/material.dart';
import '../models/activity_model.dart';
import '../models/item_model.dart';

class ActivityFormScreen extends StatefulWidget {
  final String environmentId;
  final String categoryId;
  final String itemId;
  final Function(Activity) onActivityCreated;

  ActivityFormScreen({
    required this.environmentId,
    required this.categoryId,
    required this.itemId,
    required this.onActivityCreated,
  });

  @override
  _ActivityFormScreenState createState() => _ActivityFormScreenState();
}

class _ActivityFormScreenState extends State<ActivityFormScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _description = '';

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final activity = Activity(
        dateTime: DateTime.now(),
        user: 'currentUser', // Atualize com o usuário atual
        name: _name,
        description: _description,
        attachments: [],
        comments: [],
      );

      Item.createActivity(
              widget.environmentId, widget.categoryId, widget.itemId, activity)
          .then((_) {
        widget.onActivityCreated(activity);
        Navigator.pop(context);
      }).catchError((error) {
        print("Error creating activity: $error");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao criar atividade: $error')),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Activity'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
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
                child: Text('Add Activity'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
