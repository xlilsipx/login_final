import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider extends ChangeNotifier{
  final googleSignIn = GoogleSignIn();

  GoogleSignInAccount? _user;
  GoogleSignInAccount get user=> _user!;

  Future googleLogin() async {
    try{
      final googleUser = await googleSignIn.signIn();

      if (googleUser == null){
        return;
      } else{
        _user = googleUser;
      }
      //_user = googleUser; // besser wenn als else statement geschriben wird?, kann else weglassen

      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);

    } catch (e) {
      print(e.toString());
    }

    notifyListeners();

  }

  Future googlelogout() async {
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
  }

}
