import 'package:flutter/material.dart';
import 'package:login_final/constants.dart';
import 'package:auth_buttons/auth_buttons.dart';
//import 'package:login_final/authentication_Final.dart';
import 'dart:convert';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:login_final/user_data_page.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreenFinal extends StatefulWidget {


  @override
  _LoginScreenFinalState createState() => _LoginScreenFinalState();
}

class _LoginScreenFinalState extends State<LoginScreenFinal> {


  final _auth = FirebaseAuth.instance;
  bool isLoadingGgl = false;
  bool isLoadingFb = false;
  bool isLoadingAppl = false;
  bool _rememberMe = false;
  late String email;
  late String password;

  //siddha
  final googleSignIn = GoogleSignIn();

  GoogleSignInAccount? _user;
  //GoogleSignInAccount get user=> _user!;

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

    //notifyListeners(); siddha hier evtl faul

  }

  Future googlelogout() async {
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
  }
  //siddha

  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) {
              email = value;
            },
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.white,
              ),
              hintText: 'Enter your Email',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[

        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(

            obscureText: true,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            onChanged: (value) {
              password = value;
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'Enter your Password',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildForgotPasswordBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () => print('Forgot Password Button Pressed'),
        //padding: EdgeInsets.only(right: 0.0),
        child: Text(
          'Forgot Password?',
          style: kLabelStyle,
        ),
      ),
    );
  }

  Widget _buildGoogleLoginButton() {
    return GoogleAuthButton(
      onPressed: () {
        setState(() {
          isLoadingGgl = !isLoadingGgl;
          googleLogin();

          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => UserDataPage(
          //       userData: _user,
          //       accessToken: _accessToken,
          //     ),
          //   ),
          // );

        });
      },
      darkMode: false,
      isLoading: isLoadingGgl,
      style: AuthButtonStyle(
        iconSize: 24.0,
        borderRadius: 8.0,
        width: 280.0,
      ),
      //buttonType: buttonType;
    );
  }

  Widget _buildAppleLoginButton() {
    return AppleAuthButton(
      onPressed: () {
        setState(() {
          isLoadingAppl = !isLoadingAppl;
        });
      },
      darkMode: false,
      isLoading: isLoadingAppl,
      style: AuthButtonStyle(
        iconSize: 24.0,
        borderRadius: 8.0,
        width: 280.0,
      ),
      //buttonType: buttonType;
    );
  }

  Widget _buildFacebookLoginButton() {
    return FacebookAuthButton(
      onPressed: () {
        setState(() {
          isLoadingFb = !isLoadingFb;
          _fblogin();

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UserDataPage(
                  userData: _userData,
                  accessToken: _accessToken,
              ),
            ),
          );
          isLoadingFb = !isLoadingFb;


        });

      },
      darkMode: false,
      isLoading: isLoadingFb,
      style: AuthButtonStyle(
        iconSize: 24.0,
        borderRadius: 8.0,
        width: 280.0,
      ),
      //buttonType: buttonType;
    );
  }


  Widget _buildRememberMeCheckbox() {
    return Container(
      height: 20.0,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: _rememberMe,
              checkColor: Colors.green,
              activeColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  _rememberMe = value!;
                });
              },
            ),
          ),
          Text(
            'Remember me',
            style: kLabelStyle,
          ),
        ],
      ),
    );
  }

  Widget _emailLogInButton() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.lightBlueAccent
      ),
      child: TextButton(
        onPressed: () async {
          setState(() {
            //showSpinner = true;
          });
          try {
            final user = await _auth.signInWithEmailAndPassword(
                email: email, password: password);
            // if (user != null) {
            //   Navigator.pushNamed(context, ChatScreen.id);
            // }

            setState(() {
             // showSpinner = false;
            });
          } catch (e) {
            print(e);
          }
        },

        child: Text(
          'Log In',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }





  String prettyPrint(Map json) {
    JsonEncoder encoder = new JsonEncoder.withIndent('  ');
    String pretty = encoder.convert(json);
    return pretty;
  }

  Map<String, dynamic>? _userData;
  AccessToken? _accessToken;
  bool _checking = true;


  Future<void> _checkIfIsLogged() async {
    final accessToken = await FacebookAuth.instance.accessToken;
    // setState(() {
    //   _checking = false;
    // });
    if (accessToken != null) {
      print("is Logged:::: ${prettyPrint(accessToken.toJson())}");
      // now you can call to  FacebookAuth.instance.getUserData();
      final userData = await FacebookAuth.instance.getUserData();
      // final userData = await FacebookAuth.instance.getUserData(fields: "email,birthday,friends,gender,link");
      _accessToken = accessToken;
      setState(() {
        _userData = userData;
      });
    }
  }



  void _printCredentials() {
    print(
      prettyPrint(_accessToken!.toJson()),
    );
  }


  Future<void> _fblogin() async {
    final LoginResult result = await FacebookAuth.instance.login(); // by the fault we request the email and the public profile

    // loginBehavior is only supported for Android devices, for ios it will be ignored
    // final result = await FacebookAuth.instance.login(
    //   permissions: ['email', 'public_profile', 'user_birthday', 'user_friends', 'user_gender', 'user_link'],
    //   loginBehavior: LoginBehavior
    //       .DIALOG_ONLY, // (only android) show an authentication dialog instead of redirecting to facebook app
    // );


    if (result.status == LoginStatus.success) {
      _accessToken = result.accessToken;
      _printCredentials();
      // get the user data
      // by default we get the userId, email,name and picture
      final userData = await FacebookAuth.instance.getUserData();
      // final userData = await FacebookAuth.instance.getUserData(fields: "email,birthday,friends,gender,link");
      _userData = userData;
    } else {
      print(result.status);
      print(result.message);
    }

    setState(() {
      _checking = false;
    });
  }

  Future<void> _fbLogOut() async {
    await FacebookAuth.instance.logOut();
    _accessToken = null;
    _userData = null;
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Facebook Auth Example'),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.only(left: 20.0),
                    child: Text(
                      "Let's get Started",
                      style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(height: 50),
                _buildGoogleLoginButton(),
                _buildFacebookLoginButton(),
                _buildAppleLoginButton(),
                SizedBox(height: 10),

                SizedBox(height: 10),

                SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.only(left: 20.0),
                    child: Text(
                      "OR",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                _buildEmailTF(),
                _buildPasswordTF(),
                _buildForgotPasswordBtn(),
                _emailLogInButton(),
                _buildRememberMeCheckbox(),

              ],
            ),
          ),
        )
    );
  }
}
