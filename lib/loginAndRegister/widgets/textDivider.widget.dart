import 'package:flutter/material.dart';

Widget TextDivider( ){
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 25),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Divider(
            thickness: 0.5,
            color: Colors.grey[400],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            'Ou continue com',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.grey[700], // Cor branca
            ),
          ),
        ),
        Expanded(
          child: Divider(
            thickness: 0.5,
            color: Colors.grey[400], // Cor branca
          ),
        ),
      ],
    ),
  );
}
