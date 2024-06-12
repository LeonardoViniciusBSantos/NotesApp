import 'package:flutter/material.dart';
import 'package:notes_app/screens/home_screen.dart';
import 'config/themes.dart';
import 'screens/environment_form_screen.dart';
import 'screens/category_form_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppThemes.lightTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/environment_form': (context) => EnvironmentFormScreen(),
        '/category_form': (context) {
          final args = ModalRoute.of(context)!.settings.arguments
              as Map<String, dynamic>;
          return CategoryFormScreen(
            category: args['category'],
            onCategoryCreated: args['onCategoryCreated'],
            environmentId: '',
          );
        },
      },
    );
  }
}
