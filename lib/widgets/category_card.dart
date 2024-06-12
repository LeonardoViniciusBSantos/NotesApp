import 'package:flutter/material.dart';
import 'package:notes_app/models/category_model.dart';

class CategoryCard extends StatelessWidget {
  final Category category;
  final VoidCallback onTap;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const CategoryCard({
    Key? key,
    required this.category,
    required this.onTap,
    required this.onEdit,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Card(
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              width: 120,
              height: 100,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 55, 87, 253),
                border: Border.all(
                  width: 1,
                  color: Color.fromRGBO(189, 205, 255, 1),
                ),
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: NetworkImage("assets/imagem.png"),
                  fit: BoxFit.cover,
                ),
              ),
              padding: EdgeInsets.all(8),
              child: category.photoUrl.isEmpty
                  ? Center(
                      child: Text(
                        "Foto",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )
                  : null,
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category.name,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                Text("${category.description}"),
              ],
            ),
          ),
          PopupMenuButton<String>(
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
        ],
      ),
    );
  }
}
