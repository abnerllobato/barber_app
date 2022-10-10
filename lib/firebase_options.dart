// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyB-SoPqwtTv5H9m2fjpFvbEP5orW2ZVqRU',
    appId: '1:176414745465:web:2e33e20b897c4138bec5a8',
    messagingSenderId: '176414745465',
    projectId: 'barber-app-ba7b2',
    authDomain: 'barber-app-ba7b2.firebaseapp.com',
    storageBucket: 'barber-app-ba7b2.appspot.com',
    measurementId: 'G-JW664SEYCZ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDNYjF4AWUce_6XOtlp9_a3r8Vtv41U2ng',
    appId: '1:176414745465:android:870d92ee0750f6dbbec5a8',
    messagingSenderId: '176414745465',
    projectId: 'barber-app-ba7b2',
    storageBucket: 'barber-app-ba7b2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDpIzwOJutbG83ul8Lu7ta62ADADBsV-Us',
    appId: '1:176414745465:ios:9f5ce73ecf32025fbec5a8',
    messagingSenderId: '176414745465',
    projectId: 'barber-app-ba7b2',
    storageBucket: 'barber-app-ba7b2.appspot.com',
    iosClientId: '176414745465-82af0k3n8ioqbqd0hv05fitfki8n9cim.apps.googleusercontent.com',
    iosBundleId: 'com.example.barbeariaApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDpIzwOJutbG83ul8Lu7ta62ADADBsV-Us',
    appId: '1:176414745465:ios:9f5ce73ecf32025fbec5a8',
    messagingSenderId: '176414745465',
    projectId: 'barber-app-ba7b2',
    storageBucket: 'barber-app-ba7b2.appspot.com',
    iosClientId: '176414745465-82af0k3n8ioqbqd0hv05fitfki8n9cim.apps.googleusercontent.com',
    iosBundleId: 'com.example.barbeariaApp',
  );
}
