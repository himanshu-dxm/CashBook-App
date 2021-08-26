import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('recordBook');

class DatabaseMethods {

  Future<void> addData({
    required num amount,
    required num balance,
    required String date,
    required String time,
    required String remarks,
    required int ind
  }) async {

    DocumentReference documentReference = _mainCollection.doc();
    Map<String,dynamic> data = <String,dynamic> {
      "remarks":remarks,
      "amount":amount,
      "balance":balance,
      "date":date,
      "time":time,
      "ind":ind,
    };

    await documentReference
        .set(data)
        .whenComplete(() => print("Data uploaded"))
        .catchError((e) => print(e));
  }

  Stream<QuerySnapshot> readData() {
    CollectionReference recordCollection = _firestore.collection('recordBook');
    return recordCollection.snapshots();
  }
}