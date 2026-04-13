import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDT1rj0kooP-KsxPHJPibriDozn1P2gvxg",
            authDomain: "proyecto-d-valens-grupo-ptsiun.firebaseapp.com",
            projectId: "proyecto-d-valens-grupo-ptsiun",
            storageBucket: "proyecto-d-valens-grupo-ptsiun.firebasestorage.app",
            messagingSenderId: "507318103646",
            appId: "1:507318103646:web:4f3f179fd739a30054cecf"));
  } else {
    await Firebase.initializeApp();
  }
}
