import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:login_final/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';


class SignInPage3 extends StatefulWidget {
  @override
  _SignInPage3State createState() => _SignInPage3State();
}

class _SignInPage3State extends State<SignInPage3> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("some title")),
      body: Container(
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                child: Text("Login with Google"),
                onPressed: () {
                  print('google was pressed');
                  final provider =
                  Provider.of<GoogleSignInProvider>(context, listen: false);
                  provider.googleLogin();
                },
              ),
              ElevatedButton(
                child: Text("Login with facebook"),
                onPressed: () {
                  print('fb was pressed');

                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}