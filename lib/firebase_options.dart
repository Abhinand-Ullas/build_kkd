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
    apiKey: 'AIzaSyDE7zF3Lik6tlcZ5dk59Xd09RhRAxdlClI',
    appId: '1:256502306152:web:eddc9f435fcf721da7f2dd',
    messagingSenderId: '256502306152',
    projectId: 'build-for-kkd',
    authDomain: 'build-for-kkd.firebaseapp.com',
    storageBucket: 'build-for-kkd.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCvuII2ZLHOtkeK2Z1J6JJRmtITn0DJwxQ',
    appId: '1:256502306152:android:ac1eb3992d7569d1a7f2dd',
    messagingSenderId: '256502306152',
    projectId: 'build-for-kkd',
    storageBucket: 'build-for-kkd.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDZAQFY017Kiy4AvV4wmwFKyxI5XIqrHZs',
    appId: '1:256502306152:ios:3b6a0edefeef0618a7f2dd',
    messagingSenderId: '256502306152',
    projectId: 'build-for-kkd',
    storageBucket: 'build-for-kkd.firebasestorage.app',
    iosBundleId: 'com.example.yourAppName',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDZAQFY017Kiy4AvV4wmwFKyxI5XIqrHZs',
    appId: '1:256502306152:ios:3b6a0edefeef0618a7f2dd',
    messagingSenderId: '256502306152',
    projectId: 'build-for-kkd',
    storageBucket: 'build-for-kkd.firebasestorage.app',
    iosBundleId: 'com.example.yourAppName',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDE7zF3Lik6tlcZ5dk59Xd09RhRAxdlClI',
    appId: '1:256502306152:web:768a930312188fd7a7f2dd',
    messagingSenderId: '256502306152',
    projectId: 'build-for-kkd',
    authDomain: 'build-for-kkd.firebaseapp.com',
    storageBucket: 'build-for-kkd.firebasestorage.app',
  );
}
