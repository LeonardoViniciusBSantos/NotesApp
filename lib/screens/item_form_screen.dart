import 'package:flutter/material.dart';
import '../models/item_model.dart';

class ItemFormScreen extends StatefulWidget {
  final String environmentId;
  final String categoryId;
  final Item? item;
  final Function(Item) onItemCreated;

  ItemFormScreen({
    required this.environmentId,
    required this.categoryId,
    this.item,
    required this.onItemCreated,
  });

  @override
  _ItemFormScreenState createState() => _ItemFormScreenState();
}

class _ItemFormScreenState extends State<ItemFormScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _description = '';

  @override
  void initState() {
    super.initState();
    if (widget.item != null) {
      _name = widget.item!.name;
      _description = widget.item!.description;
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final item = Item(
        id: widget.item?.id ?? '',
        name: _name,
        description: _description,
        activities: [], // Você pode adicionar lógica para atividades aqui
      );

      if (widget.item == null) {
        Item.createItem(widget.environmentId, widget.categoryId, item)
            .then((_) {
          widget.onItemCreated(item);
          Navigator.pop(context);
        }).catchError((error) {
          print("Error creating item: $error");
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Erro ao criar item: $error')),
          );
        });
      } else {
        item.updateItem(widget.environmentId, widget.categoryId).then((_) {
          widget.onItemCreated(item);
          Navigator.pop(context);
        }).catchError((error) {
          print("Error updating item: $error");
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Erro ao atualizar item: $error')),
          );
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.item == null ? 'Add Item' : 'Edit Item'),
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
                child: Text(widget.item == null ? 'Create' : 'Update'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
