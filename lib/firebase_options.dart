 // File generated from the Firebase configuration files supplied by DevOps.
 // ignore_for_file: type=lint

import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'Firebase options are not configured for web.',
      );
    }

    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      default:
        throw UnsupportedError(
          'Firebase options are not configured for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAsvSJ5YoSdYUxmpZNMAoim2ACDVXMF02E',
    appId: '1:73941617920:android:cdacaeec24abe367be37e5',
    messagingSenderId: '73941617920',
    projectId: 'famnme-51a83',
    storageBucket: 'famnme-51a83.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBGXZk_BiJnCd--LECEI9DyumwmMGo0lFs',
    appId: '1:73941617920:ios:535026a195a3da8abe37e5',
    messagingSenderId: '73941617920',
    projectId: 'famnme-51a83',
    storageBucket: 'famnme-51a83.firebasestorage.app',
    iosBundleId: 'com.sbl.familyaconnect',
  );
}
