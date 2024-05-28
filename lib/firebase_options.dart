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
    apiKey: 'AIzaSyBBJL3bUkQ9q8PM6MRmzHTarHotIxgW6y4',
    appId: '1:620415248644:web:c0e6d75edc95df1d1b0851',
    messagingSenderId: '620415248644',
    projectId: 'chat-app-3acd7',
    authDomain: 'chat-app-3acd7.firebaseapp.com',
    storageBucket: 'chat-app-3acd7.appspot.com',
    measurementId: 'G-TNK5L248LJ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDRTOYQunielrlnLo6MDj_0ZHdLlt7bEaM',
    appId: '1:620415248644:android:44bf287f746b01dd1b0851',
    messagingSenderId: '620415248644',
    projectId: 'chat-app-3acd7',
    storageBucket: 'chat-app-3acd7.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDkTVfP3GkTVVhqLFIGHRYu-9uHmJpOT1o',
    appId: '1:620415248644:ios:1379c6a933a070ef1b0851',
    messagingSenderId: '620415248644',
    projectId: 'chat-app-3acd7',
    storageBucket: 'chat-app-3acd7.appspot.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDkTVfP3GkTVVhqLFIGHRYu-9uHmJpOT1o',
    appId: '1:620415248644:ios:1379c6a933a070ef1b0851',
    messagingSenderId: '620415248644',
    projectId: 'chat-app-3acd7',
    storageBucket: 'chat-app-3acd7.appspot.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBBJL3bUkQ9q8PM6MRmzHTarHotIxgW6y4',
    appId: '1:620415248644:web:800256d008d420421b0851',
    messagingSenderId: '620415248644',
    projectId: 'chat-app-3acd7',
    authDomain: 'chat-app-3acd7.firebaseapp.com',
    storageBucket: 'chat-app-3acd7.appspot.com',
    measurementId: 'G-YF7YT45PL2',
  );
}
