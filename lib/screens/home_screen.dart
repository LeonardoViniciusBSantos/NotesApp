import 'package:flutter/material.dart';
import 'package:notes_app/models/environment_model.dart';
import '../widgets/environment_card.dart';
import '../mock_data/mock_environments.dart';
import 'environment_form_screen.dart';
import 'environment_screen.dart';

class HomeScreen extends StatelessWidget {
  void _addEnvironment(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EnvironmentFormScreen(),
      ),
    );
  }

  void _editEnvironment(BuildContext context, Environment environment) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EnvironmentFormScreen(environment: environment),
      ),
    );
  }

  void _deleteEnvironment(Environment environment) {
    mockEnvironments.remove(environment);
    // Notify the UI
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ambientes'),
      ),
      body: ListView.builder(
        itemCount: mockEnvironments.length,
        itemBuilder: (context, index) {
          final environment = mockEnvironments[index];
          return EnvironmentCard(
            name: environment.name,
            photoUrl: environment.photoUrl,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      EnvironmentScreen(environment: environment),
                ),
              );
            },
            onEdit: () => _editEnvironment(context, environment),
            onDelete: () => _deleteEnvironment(environment),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addEnvironment(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
