import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback onBackPressed;

  CustomAppBar({required this.title, required this.onBackPressed});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: onBackPressed,
      ),
      title: Text(title),
      actions: [
        IconButton(
          icon: Icon(Icons.more_vert),
          onPressed: () {
            // handle menu actions here
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
