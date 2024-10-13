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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDg7W5NiIauqYFwROc-mwBJJ5D_XHnubis',
    appId: '1:24482411291:web:932ee5b00258d1ce1899be',
    messagingSenderId: '24482411291',
    projectId: 'flutter-bp-tetsukick-dev',
    authDomain: 'flutter-bp-tetsukick-dev.firebaseapp.com',
    storageBucket: 'flutter-bp-tetsukick-dev.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB8w2pb7Hm3WU36unw4S3zOLc0uRfPfyFg',
    appId: '1:24482411291:android:d10010d0b823dcc31899be',
    messagingSenderId: '24482411291',
    projectId: 'flutter-bp-tetsukick-dev',
    storageBucket: 'flutter-bp-tetsukick-dev.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCidB-U14adb-Dd883Mpou2OvAtNm5T6bE',
    appId: '1:24482411291:ios:cafc578a9b96b1201899be',
    messagingSenderId: '24482411291',
    projectId: 'flutter-bp-tetsukick-dev',
    storageBucket: 'flutter-bp-tetsukick-dev.appspot.com',
    iosBundleId: 'com.example.verygoodcore.flutter.boilerplate.dev',
  );
}
