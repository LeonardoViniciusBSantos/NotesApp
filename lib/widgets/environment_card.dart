import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EnvironmentCard extends StatelessWidget {
  final String name;
  final String photoUrl;
  final VoidCallback onTap;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  EnvironmentCard({
    required this.name,
    required this.photoUrl,
    required this.onTap,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 5),
      leading: Container(
          width: 120,
          height: 80,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.elliptical(5, 5)),
              image: DecorationImage(
                image: NetworkImage("assets/barber-logo.jpg"),
              ))),
      title: Text(name),
      onTap: onTap,
      trailing: PopupMenuButton<String>(
        onSelected: (String value) {
          if (value == 'edit') {
            onEdit();
          } else if (value == 'delete') {
            onDelete();
          }
        },
        itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
          const PopupMenuItem<String>(
            value: 'edit',
            child: ListTile(
              leading: Icon(Icons.edit),
              title: Text('Editar'),
            ),
          ),
          const PopupMenuItem<String>(
            value: 'delete',
            child: ListTile(
              leading: Icon(Icons.delete),
              title: Text('Excluir'),
            ),
          ),
        ],
      ),
    );
  }
}
