

import 'dart:convert';

import 'package:expenses_record/models/DateTime.dart';
import 'package:expenses_record/models/Transcations.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class RealtimeDB {
  FirebaseDatabase database = FirebaseDatabase.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref();

  Future<void> writeData() async{
    debugPrint("in write data method");
    Transactions transaction = new Transactions(
      title: "title1",
      transactionId: "tid1",
      amount: 100,
      category: "category1",
      timestamp: DateTime.now().toString(),
      dateTime: MyDateTime(
        date: 11,
        day: "Fri",
        month: "Nov",
        hour: 02,
        min: 30,
        year: 2022
      )
    );
    // String json = jsonEncode(transaction);
    print("Json data:\n"+transaction.toJson().toString() );
    try {
      DatabaseReference ref = FirebaseDatabase.instance.ref("users/125");
      await ref.set(transaction.toJson());
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
    debugPrint("Writing Done");
  }

  Future<void> readData() async {
    DatabaseReference ref = FirebaseDatabase.instance.ref('users');
    // DatabaseReference ref = FirebaseDatabase.instance.ref();
    final event = await ref.once();
    Map x = event.snapshot.value as Map;
    print("Data:\n"+x["124"]["title"]);
    // var users = event.snapshot.value?.users ?? "No val";
    // final ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref.child('users');

  }
}
