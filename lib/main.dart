import 'package:flutter/material.dart';
import 'package:mobel_geming/pages/login.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // app = await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      appId: '1:415397544232:android:0b563aef233bccad97101d',
      apiKey: 'AIzaSyC_IPU5CpZg8kp3cbQV9Lwg-2Dn6eemcng',
      messagingSenderId: '415397544232',
      projectId: 'mobilegeming-f7110',
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // appBar: AppBar(
        //   title: Text('My App'),
        // ),
        body: Login(),
      ),
    );
  }
}
