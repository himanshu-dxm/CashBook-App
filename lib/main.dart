import 'package:expenses_record/screens/daily_page.dart';
import 'package:expenses_record/screens/home.dart';
import 'package:expenses_record/screens/rootPage.dart';
import 'package:expenses_record/utils/realtimeDB.dart';
import 'package:expenses_record/widget/DatePickerCustom.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // RealtimeDB ob = new RealtimeDB();
  // await ob.readData();
  // await ob.writeData();
  runApp(MyApp());
}
// Future<FirebaseApp> _initializeFirebase() async {
//   debugPrint("Initializing Firebase");
//   FirebaseApp firebaseApp = await Firebase.initializeApp();
//   return firebaseApp;
// }

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expenses Record',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: SafeArea(
        // child: DatePickerCustom(),
        child: RootApp(),
        // child: FutureBuilder(
        //   future: _initializeFirebase(),
        //   builder: (context,snapshot) {
        //     if(snapshot.hasError) {
        //       return Text("Error Initializing Firebase");
        //     } else if(snapshot.connectionState == ConnectionState.done) {
        //       return RootApp();
        //     }
        //     return CircularProgressIndicator(
        //       valueColor: AlwaysStoppedAnimation<Color>(
        //         Colors.orange
        //       ),
        //     );
        //   },
        // ),
      ),
    );
  }
}