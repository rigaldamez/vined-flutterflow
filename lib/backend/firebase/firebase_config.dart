import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyA1rjhxywp_z2GbG-GNbGMnNMiB-YLH2C8",
            authDomain: "vined-f38a6.firebaseapp.com",
            projectId: "vined-f38a6",
            storageBucket: "vined-f38a6.appspot.com",
            messagingSenderId: "730378082258",
            appId: "1:730378082258:web:5066b0bfc3eaeec926da0b",
            measurementId: "G-T2F70HTCP0"));
  } else {
    await Firebase.initializeApp();
  }
}
