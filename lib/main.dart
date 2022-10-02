import 'package:expenses_record/screens/daily_page.dart';
import 'package:expenses_record/screens/home.dart';
import 'package:expenses_record/screens/rootPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    Future<FirebaseApp> _initializeFirebase() async {
      FirebaseApp firebaseApp = await Firebase.initializeApp();
      return firebaseApp;
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expenses Record',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: SafeArea(
        child: FutureBuilder(
          future: _initializeFirebase(),
          builder: (context,snapshot) {
            if(snapshot.hasError) {
              return Text("Error Initializing Firebase");
            } else if(snapshot.connectionState == ConnectionState.done) {
              return RootApp();
            }
            return CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                Colors.orange
              ),
            );
          },
        ),
      ),
    );
  }
}