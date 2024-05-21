import 'package:flutter/material.dart';
import 'package:notes_app/loginAndRegister/login.view.dart';

import 'register.view.dart';

class LoginOrRegisterPage extends StatefulWidget {
  const LoginOrRegisterPage({super.key});

  @override
  State<LoginOrRegisterPage> createState() => _LoginOrRegisterPageState();
}

class _LoginOrRegisterPageState extends State<LoginOrRegisterPage> {
  bool showLoginPage = true;

  void togglePage() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginView(onTap: togglePage);
    } else {
      return RegisterView(
        onTap: togglePage,
      );
    }
  }
}
