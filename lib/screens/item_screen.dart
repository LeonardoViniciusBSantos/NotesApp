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

  const ItemDetailScreen({
    Key? key,
    required this.item,
    required this.environmentId,
    required this.categoryId,
  }) : super(key: key);

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
      widget.environmentId,
      widget.categoryId,
      widget.item.id,
    );

    // Ordenar as atividades pela data em ordem decrescente
    activities.sort((a, b) => b.dateTime.compareTo(a.dateTime));

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
              // Ordenar as atividades novamente após adicionar uma nova
              _activities.sort((a, b) => b.dateTime.compareTo(a.dateTime));
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
        title: Text('Detalhes do Item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.item.name,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "Descrição: ${widget.item.description}",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Atividades:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: _activities.length,
                itemBuilder: (context, index) {
                  final activity = _activities[index];
                  return ActivityCard(
                    activity: activity,
                    onTap: () => _viewActivityDetails(context, activity),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _navigateToAddActivityScreen(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
