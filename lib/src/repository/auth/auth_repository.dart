import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:code_sliver/src/common/config/constants.dart';
import 'package:code_sliver/src/common/firebase/firebase_db.dart';
import 'package:code_sliver/src/common/firebase/firebase_fcm.dart';
import 'package:code_sliver/src/model/entity/auth/user_model.dart';

class AuthRepository {
  late FirebaseDb firebaseDb;

  static final AuthRepository _instance = AuthRepository._internal();

  factory AuthRepository() {
    return _instance;
  }

  AuthRepository._internal() {
    firebaseDb = FirebaseDb();
    log('Singleton Instance Created <AuthRepository>');
  }

  Future<void> createUser({required String uid}) async {
    String fcmToken = await CustomFcm().getFCMToken();

    UserModel userModel = UserModel(
      uid: uid,
      imgUrl: "",
      name: "",
      introduce: "",
      noWorkDayList: [],
      policeClearanceFlag: false,
      fcmToken: fcmToken,
      userRole: 'USER',
    );

    await firebaseDb.firebaseFirestore.collection(DbConstants.USER_TABLE).doc().set(
          userModel.toJson(),
        );
  }

  Future<UserModel?> findUser({required String uid}) async {
    QuerySnapshot result = await firebaseDb.firebaseFirestore.collection(DbConstants.USER_TABLE).where("uid", isEqualTo: uid).get();
    if (result.docs.isEmpty) {
      return null;
    }
    UserModel userModel = UserModel.fromDocument(result.docs.first);
    return userModel;
  }

  Future<void> updateUserFcmToken({required String uid, required String fcmToken}) async {
    QuerySnapshot querySnapshot = await firebaseDb.firebaseFirestore.collection(DbConstants.USER_TABLE).where("uid", isEqualTo: uid).get();
    DocumentSnapshot documentSnapshot = querySnapshot.docs.first;
    await firebaseDb.firebaseFirestore.collection(DbConstants.USER_TABLE).doc(documentSnapshot.id).update({"fcmToken": fcmToken});
  }
}
