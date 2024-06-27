


import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseDb {
  late FirebaseFirestore firebaseFirestore;
  late FirebaseStorage firebaseStorage;

  static final FirebaseDb _instance = FirebaseDb._internal();

  factory FirebaseDb() {
    return _instance;
  }
  FirebaseDb._internal() {
    init();
    log('Singleton Instance Created <FirebaseDb>');
  }

  Future<void> init() async {
    firebaseFirestore = FirebaseFirestore.instance;
    firebaseStorage = FirebaseStorage.instance;
  }
}