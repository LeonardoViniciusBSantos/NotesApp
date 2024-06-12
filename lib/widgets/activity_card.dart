import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/activity_model.dart';

class ActivityCard extends StatelessWidget {
  final Activity activity;
  final VoidCallback onTap;

  const ActivityCard({
    Key? key,
    required this.activity,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Icon(Icons.adjust),
                Container(
                  width: 2.0,
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.symmetric(
                      vertical: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(width: 20),
            Expanded(
              child: Card(
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        DateFormat('dd/MM/yyyy HH:mm')
                            .format(activity.dateTime),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        activity.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0,
                        ),
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
            ),
          ],
        ),
      ),
    );
  }
}
