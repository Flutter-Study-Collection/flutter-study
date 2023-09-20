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
    apiKey: 'AIzaSyAiuAzEc4_-zOkvypGnQqGYBkrYfFgSYWE',
    appId: '1:950568365331:web:32af2326252a8fedb17ee6',
    messagingSenderId: '950568365331',
    projectId: 'test-project-23471',
    authDomain: 'test-project-23471.firebaseapp.com',
    databaseURL: 'https://test-project-23471.firebaseio.com',
    storageBucket: 'test-project-23471.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDLh_tfxPcQ18jC4a1rzym2Bmd9iYpnQVU',
    appId: '1:950568365331:android:1521a2fba95711aeb17ee6',
    messagingSenderId: '950568365331',
    projectId: 'test-project-23471',
    databaseURL: 'https://test-project-23471.firebaseio.com',
    storageBucket: 'test-project-23471.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBNVeaMWiXXeoKfC3Yg60FBZKXRdVIacG4',
    appId: '1:950568365331:ios:19fa63d9a2809dc7b17ee6',
    messagingSenderId: '950568365331',
    projectId: 'test-project-23471',
    databaseURL: 'https://test-project-23471.firebaseio.com',
    storageBucket: 'test-project-23471.appspot.com',
    iosClientId: '950568365331-jo1f4fhfbfr3ofp1ib8u51egoqqbsdn5.apps.googleusercontent.com',
    iosBundleId: 'com.example.storage',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBNVeaMWiXXeoKfC3Yg60FBZKXRdVIacG4',
    appId: '1:950568365331:ios:b24bd2449f461cffb17ee6',
    messagingSenderId: '950568365331',
    projectId: 'test-project-23471',
    databaseURL: 'https://test-project-23471.firebaseio.com',
    storageBucket: 'test-project-23471.appspot.com',
    iosClientId: '950568365331-8tt1hunmk5kvprcaeu1ns2b6l435jfav.apps.googleusercontent.com',
    iosBundleId: 'com.example.storage.RunnerTests',
  );
}
