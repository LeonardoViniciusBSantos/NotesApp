import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/activity_model.dart';

class ActivityDetailScreen extends StatelessWidget {
  final Activity activity;

  const ActivityDetailScreen({Key? key, required this.activity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes da Atividade'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nome: ${activity.name}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Descrição: ${activity.description}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Data/Hora: ${DateFormat('dd/MM/yyyy HH:mm').format(activity.dateTime)}',
              style: TextStyle(fontSize: 16),
            ),
            // Adicione mais informações da atividade conforme necessário
            // Placeholders para anexos e comentários
            SizedBox(height: 16),
            Text(
              'Anexos:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            // Implementar a exibição de anexos aqui
            SizedBox(height: 8),
            Text(
              'Comentários:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            // Implementar a exibição de comentários aqui
          ],
        ),
      ),
    );
  }
}
