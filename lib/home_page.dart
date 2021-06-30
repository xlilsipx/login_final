import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_final/signin_page3.dart';
import 'package:login_final/logged_in_widget.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            return LoggedInWidget();
          }
          else if (snapshot.hasError) {
            return Center(child: Text('somethinf went wrong!!'),);
          }
          else {
            return SignInPage3();
          }
          }),
    );
  }
}
