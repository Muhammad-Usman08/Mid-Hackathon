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
    apiKey: 'AIzaSyBE7Gdx9kNOsOK5AMDyiSmgj4ViAWdY4ZY',
    appId: '1:41714720469:web:ff347a38a1b95a96db8c5c',
    messagingSenderId: '41714720469',
    projectId: 'hackhathon-2e437',
    authDomain: 'hackhathon-2e437.firebaseapp.com',
    storageBucket: 'hackhathon-2e437.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAOUsdNS4tG57-dSiuFbxLXvxsFNL-qbtA',
    appId: '1:41714720469:android:7aa8e7bfccebfcaadb8c5c',
    messagingSenderId: '41714720469',
    projectId: 'hackhathon-2e437',
    storageBucket: 'hackhathon-2e437.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAmeS9ooIAV0CYLGyb6jS8w6IzAo4vIjIs',
    appId: '1:41714720469:ios:595f70a1f424a8d2db8c5c',
    messagingSenderId: '41714720469',
    projectId: 'hackhathon-2e437',
    storageBucket: 'hackhathon-2e437.appspot.com',
    iosBundleId: 'com.example.myapp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBE7Gdx9kNOsOK5AMDyiSmgj4ViAWdY4ZY',
    appId: '1:41714720469:web:3bbcddc69272ec1adb8c5c',
    messagingSenderId: '41714720469',
    projectId: 'hackhathon-2e437',
    authDomain: 'hackhathon-2e437.firebaseapp.com',
    storageBucket: 'hackhathon-2e437.appspot.com',
  );
}
