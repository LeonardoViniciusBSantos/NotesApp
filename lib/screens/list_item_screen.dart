import 'package:flutter/material.dart';
import 'package:notes_app/screens/item_screen.dart';
import '../models/category_model.dart';
import '../models/item_model.dart';
import 'item_form_screen.dart';
import '../widgets/item_card.dart';

class ItemListScreen extends StatefulWidget {
  final Category category;
  final String environmentId;

  ItemListScreen({required this.category, required this.environmentId});

  @override
  _ItemListScreenState createState() => _ItemListScreenState();
}

class _ItemListScreenState extends State<ItemListScreen> {
  List<Item> _items = [];

  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  Future<void> _loadItems() async {
    final items =
        await Item.listItems(widget.environmentId, widget.category.id);
    setState(() {
      _items = items;
    });
  }

  void _navigateToAddItemScreen(
      BuildContext context, String environmentId, String categoryId) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ItemFormScreen(
          environmentId: environmentId,
          categoryId: categoryId,
          onItemCreated: (newItem) {
            setState(() {
              _items.add(newItem);
            });
          },
        ),
      ),
    );
  }

  void _navigateToEditItemScreen(BuildContext context, Item item) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ItemFormScreen(
          environmentId: widget.environmentId,
          categoryId: widget.category.id,
          item: item,
          onItemCreated: (editedItem) {
            setState(() {
              final index = _items.indexOf(item);
              if (index != -1) {
                _items[index] = editedItem;
              }
            });
          },
        ),
      ),
    );
  }

  void _deleteItem(Item item) async {
    await Item.deleteItem(widget.environmentId, widget.category.id, item.id);
    setState(() {
      _items.remove(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.name),
      ),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          final item = _items[index];
          return ItemCard(
            item: item,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ItemDetailScreen(
                    environmentId: widget.environmentId,
                    categoryId: widget.category.id,
                    item: item,
                  ),
                ),
              );
            },
            onEdit: () => _navigateToEditItemScreen(context, item),
            onDelete: () => _deleteItem(item),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _navigateToAddItemScreen(
            context, widget.environmentId, widget.category.id),
        child: Icon(Icons.add),
      ),
    );
  }
}
