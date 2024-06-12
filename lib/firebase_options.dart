// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDJwWx-v_5nwlOAJW54EooTFY3lKoZdkTk',
    appId: '1:572887673715:web:9c0d28cd975de7627ff306',
    messagingSenderId: '572887673715',
    projectId: 'notas-app-386af',
    authDomain: 'notas-app-386af.firebaseapp.com',
    storageBucket: 'notas-app-386af.appspot.com',
    measurementId: 'G-K5QHQ6MT21',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC-LvzvOcJyTHiOZFx9LshTGjMem3uqnpY',
    appId: '1:572887673715:android:e86c66aa14b394a87ff306',
    messagingSenderId: '572887673715',
    projectId: 'notas-app-386af',
    storageBucket: 'notas-app-386af.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAc6bnH-dKws3reoOexkX8yrEXByLLYq94',
    appId: '1:572887673715:ios:b5f8cf6e0d92ecd27ff306',
    messagingSenderId: '572887673715',
    projectId: 'notas-app-386af',
    storageBucket: 'notas-app-386af.appspot.com',
    iosBundleId: 'com.example.notesApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAc6bnH-dKws3reoOexkX8yrEXByLLYq94',
    appId: '1:572887673715:ios:b5f8cf6e0d92ecd27ff306',
    messagingSenderId: '572887673715',
    projectId: 'notas-app-386af',
    storageBucket: 'notas-app-386af.appspot.com',
    iosBundleId: 'com.example.notesApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDJwWx-v_5nwlOAJW54EooTFY3lKoZdkTk',
    appId: '1:572887673715:web:b66af0b8d663eb557ff306',
    messagingSenderId: '572887673715',
    projectId: 'notas-app-386af',
    authDomain: 'notas-app-386af.firebaseapp.com',
    storageBucket: 'notas-app-386af.appspot.com',
    measurementId: 'G-GQM1CK0R6P',
  );
}