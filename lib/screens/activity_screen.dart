import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/activity_model.dart';

class ActivityDetailScreen extends StatelessWidget {
  final Activity activity;

  ActivityDetailScreen({required this.activity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(activity.name),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              activity.name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
            ),
            SizedBox(height: 8.0),
            Text(
              DateFormat('dd/MM/yyyy HH:mm').format(activity.dateTime),
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            Text(
              activity.description,
              style: TextStyle(fontSize: 16.0),
            ),
            // Exibir anexos e comentários se necessário
          ],
        ),
      ),
    );
  }
}
