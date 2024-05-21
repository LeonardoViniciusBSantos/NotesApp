import 'package:flutter/material.dart';
import 'package:notes_app/screens/activity_screen.dart';
import '../models/item_model.dart';
import '../models/activity_model.dart';
import '../widgets/activity_card.dart';

class ItemDetailScreen extends StatelessWidget {
  final Item item;

  ItemDetailScreen({required this.item});

  void _viewActivityDetails(BuildContext context, Activity activity) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ActivityDetailScreen(activity: activity),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
      ),
      body: ListView.builder(
        itemCount: item.activities.length,
        itemBuilder: (context, index) {
          final activity = item.activities[index];
          return ActivityCard(
            activity: activity,
            onTap: () => _viewActivityDetails(context, activity),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Implementar adição de nova atividade
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
