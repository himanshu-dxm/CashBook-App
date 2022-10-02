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
      "docId":documentReference.id,
    };

    await documentReference
        .set(data)
        .whenComplete(() {
          print("Data uploaded");
        })
        .catchError((e) => print(e));
  }

  Stream<QuerySnapshot> readData() {
    CollectionReference recordCollection = _firestore.collection('recordBook');
    return recordCollection.snapshots();
  }

  Future<void> updateData({
    required num amount,
    required num balance,
    required String date,
    required String time,
    required String remarks,
    required int ind,
    required String docId,
  }) async {

    DocumentReference documentReference = _mainCollection.doc(docId);
    Map<String,dynamic> data = <String,dynamic> {
      "remarks":remarks,
      "amount":amount,
      "balance":balance,
      "date":date,
      "time":time,
      "ind":ind,
    };

    await documentReference
        .update(data)
        .whenComplete(() {
      print("Data updated");
    })
        .catchError((e) => print(e));
  }

  Future<void> deleteData(String docId) async {
    DocumentReference documentReference = _mainCollection.doc(docId);
    await documentReference.delete()
        .whenComplete(() => print("Data Deleted"))
        .catchError((e) => print(e));
  }

}