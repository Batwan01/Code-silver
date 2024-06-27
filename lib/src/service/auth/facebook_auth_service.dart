
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FacebookAuthService {
   Future<String> signInWithFacebook() async {
     LoginResult loginResult = await  FacebookAuth.instance.login();

     final credential = FacebookAuthProvider.credential(loginResult.accessToken!.token);

     UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
     return userCredential.user!.uid;
   }
}