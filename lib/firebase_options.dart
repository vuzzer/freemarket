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
    apiKey: 'AIzaSyCaadJhPFqd40medk_0iK_DUaooJHapHtI',
    appId: '1:605726570322:web:bbc84336ac0860819aec8b',
    messagingSenderId: '605726570322',
    projectId: 'theta-1a323',
    authDomain: 'theta-1a323.firebaseapp.com',
    storageBucket: 'theta-1a323.appspot.com',
    measurementId: 'G-5T92CN6T7D',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCS_5d9HRYvbMDtANRAHFBtHpaGVWSCPdw',
    appId: '1:605726570322:android:eba7fddb3250680b9aec8b',
    messagingSenderId: '605726570322',
    projectId: 'theta-1a323',
    storageBucket: 'theta-1a323.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD6v2vOkAKXVQQmzaNKleL74acyRb17I18',
    appId: '1:605726570322:ios:dc7a98ce958afecf9aec8b',
    messagingSenderId: '605726570322',
    projectId: 'theta-1a323',
    storageBucket: 'theta-1a323.appspot.com',
    androidClientId: '605726570322-05spivt92c871vu7smk0vflbp4pnpqiu.apps.googleusercontent.com',
    iosClientId: '605726570322-fbl7igghirkcc5ueeg38u2mg19fl715v.apps.googleusercontent.com',
    iosBundleId: 'com.example.defi',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD6v2vOkAKXVQQmzaNKleL74acyRb17I18',
    appId: '1:605726570322:ios:dc7a98ce958afecf9aec8b',
    messagingSenderId: '605726570322',
    projectId: 'theta-1a323',
    storageBucket: 'theta-1a323.appspot.com',
    androidClientId: '605726570322-05spivt92c871vu7smk0vflbp4pnpqiu.apps.googleusercontent.com',
    iosClientId: '605726570322-fbl7igghirkcc5ueeg38u2mg19fl715v.apps.googleusercontent.com',
    iosBundleId: 'com.example.defi',
  );
}
