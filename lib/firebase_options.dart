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
    apiKey: '',
    appId: '1:358097807545:web:b01552f0ff7fba32d69368',
    messagingSenderId: '358097807545',
    projectId: 'chat-app-6fe26',
    authDomain: 'chat-app-6fe26.firebaseapp.com',
    storageBucket: 'chat-app-6fe26.appspot.com',
    measurementId: 'G-G8VWVCDKSJ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: '',
    appId: '1:358097807545:android:fd25dd78bd131314d69368',
    messagingSenderId: '358097807545',
    projectId: 'chat-app-6fe26',
    storageBucket: 'chat-app-6fe26.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: '',
    appId: '1:358097807545:ios:d23a0efcae5951bfd69368',
    messagingSenderId: '358097807545',
    projectId: 'chat-app-6fe26',
    storageBucket: 'chat-app-6fe26.appspot.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBhH02ivf49dXAvPtNRgFEBOlgW6HKxmTk',
    appId: '1:358097807545:ios:d23a0efcae5951bfd69368',
    messagingSenderId: '358097807545',
    projectId: 'chat-app-6fe26',
    storageBucket: 'chat-app-6fe26.appspot.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBvh6_fCLtxBAMG3vJJPr2oBQHzTTJ6vYQ',
    appId: '1:358097807545:web:ed915081e3b8ab48d69368',
    messagingSenderId: '358097807545',
    projectId: 'chat-app-6fe26',
    authDomain: 'chat-app-6fe26.firebaseapp.com',
    storageBucket: 'chat-app-6fe26.appspot.com',
    measurementId: 'G-2JNH9DEJ29',
  );
}
