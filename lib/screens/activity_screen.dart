import 'package:flutter/material.dart';
import 'package:notes_app/models/activity_model.dart';

class ActivityDetailScreen extends StatelessWidget {
  final Activity activity;

  ActivityDetailScreen({super.key, required this.activity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(activity.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              activity.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Divider(),
            Text(
              'Path: Environment - Category - Item',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            Divider(),
            Text(
              'User: ${activity.user}',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            Divider(),
            Text(
              activity.description,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.all(8),
              color: Colors.blue.withOpacity(0.1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.attach_file, color: Colors.blue),
                      SizedBox(width: 8),
                      Text(
                        'Attachments',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: Icon(Icons.add, color: Colors.blue),
                    onPressed: () {
                      // Implementar adição de novo anexo
                    },
                  ),
                ],
              ),
            ),
            Divider(),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: activity.attachments.length,
                itemBuilder: (context, index) {
                  return Image.network(activity.attachments[index]);
                },
              ),
            ),
            Divider(),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Add a comment...',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    // Implementar envio de comentário
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
