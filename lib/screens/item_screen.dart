import 'package:flutter/material.dart';
import '../models/item_model.dart';
import '../models/activity_model.dart';
import '../widgets/activity_card.dart';
import 'activity_form_screen.dart';
import 'activity_screen.dart';

class ItemDetailScreen extends StatefulWidget {
  final Item item;
  final String environmentId;
  final String categoryId;

  ItemDetailScreen(
      {required this.item,
      required this.environmentId,
      required this.categoryId});

  @override
  _ItemDetailScreenState createState() => _ItemDetailScreenState();
}

class _ItemDetailScreenState extends State<ItemDetailScreen> {
  List<Activity> _activities = [];

  @override
  void initState() {
    super.initState();
    _loadActivities();
  }

  Future<void> _loadActivities() async {
    final activities = await Item.listActivities(
        widget.environmentId, widget.categoryId, widget.item.id);
    setState(() {
      _activities = activities;
    });
  }

  void _navigateToAddActivityScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ActivityFormScreen(
          environmentId: widget.environmentId,
          categoryId: widget.categoryId,
          itemId: widget.item.id,
          onActivityCreated: (newActivity) {
            setState(() {
              _activities.add(newActivity);
            });
          },
        ),
      ),
    );
  }

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
        title: Text(widget.item.name),
      ),
      body: ListView.builder(
        itemCount: _activities.length,
        itemBuilder: (context, index) {
          final activity = _activities[index];
          return ActivityCard(
            activity: activity,
            onTap: () => _viewActivityDetails(context, activity),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _navigateToAddActivityScreen(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
