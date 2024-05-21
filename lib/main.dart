import 'package:flutter/material.dart';
import 'package:notes_app/loginAndRegister/login_or_register_page.dart';
import 'config/themes.dart';
import 'screens/environment_form_screen.dart';
import 'screens/category_form_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var environment;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppThemes.lightTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => LoginOrRegisterPage(),
        '/environment_form': (context) => EnvironmentFormScreen(),
        '/category_form': (context) =>
            CategoryFormScreen(environment: environment),
      },
    );
  }
}
