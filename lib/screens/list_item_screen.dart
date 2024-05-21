import 'package:flutter/material.dart';
import 'package:notes_app/screens/item_screen.dart';
import '../models/category_model.dart';
import '../models/item_model.dart';
import 'item_form_screen.dart';
import '../widgets/item_card.dart';

class CategoryItemsScreen extends StatefulWidget {
  final Category category;

  CategoryItemsScreen({required this.category});

  @override
  _CategoryItemsScreenState createState() => _CategoryItemsScreenState();
}

class _CategoryItemsScreenState extends State<CategoryItemsScreen> {
  void _addItem(Item item) {
    setState(() {
      widget.category.items.add(item);
    });
  }

  void _navigateToAddItemScreen(BuildContext context) {}

  void _editItem(BuildContext context, Item item) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ItemFormScreen(
            item: item,
            onItemCreated: (editedItem) {
              setState(() {
                int index = widget.category.items.indexOf(item);
                widget.category.items[index] = editedItem;
              });
            }),
      ),
    );
  }

  void _deleteItem(Item item) {
    setState(() {
      widget.category.items.remove(item);
    });
  }

  void _viewItemDetails(BuildContext context, Item item) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ItemDetailScreen(item: item),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.name),
      ),
      body: ListView.builder(
        itemCount: widget.category.items.length,
        itemBuilder: (context, index) {
          final item = widget.category.items[index];
          return ItemCard(
            item: item,
            onTap: () => _viewItemDetails(context, item),
            onEdit: () => _editItem(context, item),
            onDelete: () => _deleteItem(item),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _navigateToAddItemScreen(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
