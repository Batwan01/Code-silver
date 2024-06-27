import 'dart:developer';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:code_sliver/src/common/firebase/firebase_db.dart';

class FireStorageRepository {
  late FirebaseDb firebaseDb;

  static final FireStorageRepository _instance = FireStorageRepository._internal();

  factory FireStorageRepository() {
    return _instance;
  }

  FireStorageRepository._internal() {
    firebaseDb = FirebaseDb();
    log('Singleton Instance Created <FireStorageRepository>');
  }

  Future<String> uploadFile ({required File file}) async{
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = firebaseDb.firebaseStorage.ref().child(fileName);
    UploadTask uploadTask = reference.putFile(file);
    try{
      TaskSnapshot taskSnapshot = await uploadTask;
      String imgUrl = await taskSnapshot.ref.getDownloadURL();
      return imgUrl;
    }catch(e){
      return "";
    }
  }

}