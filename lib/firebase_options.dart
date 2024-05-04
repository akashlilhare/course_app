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
    apiKey: 'AIzaSyDpECE-7S6SOGq_zTxho2UlT5hMMa4v1O0',
    appId: '1:992965638749:web:39a64d2db598ef61f72bb4',
    messagingSenderId: '992965638749',
    projectId: 'courseapp-80df8',
    authDomain: 'courseapp-80df8.firebaseapp.com',
    storageBucket: 'courseapp-80df8.appspot.com',
    measurementId: 'G-X17F4J6Z2Y',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAoaNCXG4e_BPJklxua3PR040cSTtr_Q4A',
    appId: '1:992965638749:android:00252c77bb61b337f72bb4',
    messagingSenderId: '992965638749',
    projectId: 'courseapp-80df8',
    storageBucket: 'courseapp-80df8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAIqJcTbVwbl4IH51ikfKa5y1a2jAUobGI',
    appId: '1:992965638749:ios:7d6b43a46c2b5362f72bb4',
    messagingSenderId: '992965638749',
    projectId: 'courseapp-80df8',
    storageBucket: 'courseapp-80df8.appspot.com',
    iosBundleId: 'com.example.courseApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAIqJcTbVwbl4IH51ikfKa5y1a2jAUobGI',
    appId: '1:992965638749:ios:7d6b43a46c2b5362f72bb4',
    messagingSenderId: '992965638749',
    projectId: 'courseapp-80df8',
    storageBucket: 'courseapp-80df8.appspot.com',
    iosBundleId: 'com.example.courseApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDpECE-7S6SOGq_zTxho2UlT5hMMa4v1O0',
    appId: '1:992965638749:web:bff0214deb3773ecf72bb4',
    messagingSenderId: '992965638749',
    projectId: 'courseapp-80df8',
    authDomain: 'courseapp-80df8.firebaseapp.com',
    storageBucket: 'courseapp-80df8.appspot.com',
    measurementId: 'G-MSEP093JJJ',
  );
}