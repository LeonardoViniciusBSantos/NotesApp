import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notes_app/models/environment_model.dart';
import '../widgets/environment_card.dart';
import 'category_screen.dart';
import 'environment_form_screen.dart';

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

  void _confirmDeleteEnvironment(
      BuildContext context, Environment environment) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmar Exclusão'),
          content: Text('Você tem certeza que deseja excluir este ambiente?'),
          actions: [
            TextButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Excluir'),
              onPressed: () {
                Navigator.of(context).pop();
                _deleteEnvironment(environment);
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _deleteEnvironment(Environment environment) async {
    await FirebaseFirestore.instance
        .collection('environments')
        .doc(environment.id)
        .delete();
  }

  Stream<List<Environment>> _fetchEnvironments() {
    return FirebaseFirestore.instance
        .collection('environments')
        .snapshots()
        .asyncMap((snapshot) async {
      return Future.wait(
        snapshot.docs.map((doc) => Environment.fromDocument(doc)).toList(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ambientes'),
      ),
      body: StreamBuilder<List<Environment>>(
        stream: _fetchEnvironments(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Nenhum ambiente encontrado.'));
          }
          final environments = snapshot.data!;
          return ListView.builder(
            itemCount: environments.length,
            itemBuilder: (context, index) {
              final environment = environments[index];
              return EnvironmentCard(
                name: environment.name,
                photoUrl: environment.photoUrl,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CategoryScreen(
                        environment: environment,
                        environmentId: environment.id,
                      ),
                    ),
                  );
                },
                onEdit: () => _editEnvironment(context, environment),
                onDelete: () => _confirmDeleteEnvironment(context, environment),
              );
            },
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
