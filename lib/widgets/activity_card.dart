import 'package:flutter/material.dart';
import '../models/activity_model.dart';
import 'package:intl/intl.dart';

class ActivityCard extends StatelessWidget {
  final Activity activity;
  final VoidCallback onTap;

  ActivityCard({required this.activity, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                DateFormat('dd/MM/yyyy HH:mm').format(activity.dateTime),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
              ),
              SizedBox(height: 8.0),
              Text(
                activity.name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
              ),
              SizedBox(height: 4.0),
              Text(
                activity.description.length > 50
                    ? '${activity.description.substring(0, 50)}...'
                    : activity.description,
                style: TextStyle(fontSize: 14.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
