// // // // Copyright 2020 The Chromium Authors. All rights reserved.
// // // // Use of this source code is governed by a BSD-style license that can be
// // // // found in the LICENSE file.
// // //
// // // // @dart=2.9
// // //
// // // import 'package:firebase_auth/firebase_auth.dart';
// // // import 'package:firebase_core/firebase_core.dart';
// // // import 'package:flutter/material.dart';
// // // import 'package:flutter_signin_button/button_builder.dart';
// // //
// // // import './register_page.dart';
// // // import './signin_page.dart';
// // // import './sign_page2.dart';
// // // import './register_page2.dart';
// // // import './signin_page3.dart';
// // //
// // // // Requires that the Firebase Auth emulator is running locally
// // // // e.g via `melos run firebase:emulator`.
// // // Future<void> main() async {
// // //   WidgetsFlutterBinding.ensureInitialized();
// // //   await Firebase.initializeApp();
// // //   await FirebaseAuth.instance.useEmulator('http://localhost:9099');
// // //   runApp(AuthExampleApp());
// // // }
// // //
// // //
// // // /// The entry point of the application.
// // // ///
// // // /// Returns a [MaterialApp].
// // // class AuthExampleApp extends StatelessWidget {
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return MaterialApp(
// // //       title: 'Firebase Example App',
// // //       theme: ThemeData.light(),
// // //       home: Scaffold(
// // //         body: AuthTypeSelector(),
// // //       ),
// // //     );
// // //   }
// // // }
// // //
// // // /// Provides a UI to select a authentication type page
// // // class AuthTypeSelector extends StatelessWidget {
// // //   // Navigates to a new page
// // //   void _pushPage(BuildContext context, Widget page) {
// // //     Navigator.of(context) /*!*/ .push(
// // //       MaterialPageRoute<void>(builder: (_) => page),
// // //     );
// // //   }
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: const Text('Firebase Example App'),
// // //       ),
// // //       body: Column(
// // //         crossAxisAlignment: CrossAxisAlignment.start,
// // //         children: <Widget>[
// // //           Container(
// // //             padding: const EdgeInsets.all(16),
// // //             alignment: Alignment.center,
// // //             child: SignInButtonBuilder(
// // //               icon: Icons.person_add,
// // //               backgroundColor: Colors.indigo,
// // //               text: 'Registration',
// // //               onPressed: () => _pushPage(context, RegisterPage2()),
// // //             ),
// // //           ),
// // //           Container(
// // //             padding: const EdgeInsets.all(16),
// // //             alignment: Alignment.center,
// // //             child: SignInButtonBuilder(
// // //               icon: Icons.verified_user,
// // //               backgroundColor: Colors.orange,
// // //               text: 'Sign In',
// // //               onPressed: () => _pushPage(context, SignInPage3()),
// // //             ),
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }
// // // }
// // //
// //
// // import 'package:flutter/widgets.dart';
// // import 'package:flutter/material.dart';
// // import 'package:login_final/google_sign_in.dart';
// // import 'package:login_final/home_page.dart';
// // import 'package:provider/provider.dart';
// // import 'package:login_final/signin_page3.dart';
// // import 'package:firebase_core/firebase_core.dart';
// //
// // void main() async {
// //   WidgetsFlutterBinding.ensureInitialized();
// //   await Firebase.initializeApp();
// //   runApp(MyApp());
// // }
// //
// // class MyApp extends StatelessWidget {
// //   static final String title = 'Main Page';
// //
// //   @override
// //   Widget build(BuildContext context) => ChangeNotifierProvider(
// //     create: (context) => GoogleSignInProvider(),
// //     child: MaterialApp(
// //       debugShowCheckedModeBanner: false,
// //       title: title,
// //       theme: ThemeData.dark().copyWith(accentColor: Colors.indigo),
// //       home: HomePage(),
// //     ),
// //   );
// //
// // }
//
// import 'dart:convert';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
// import 'package:login_final/facebook_log_in.dart';
// import 'package:flutter_signin_button/flutter_signin_button.dart';
// import 'package:login_final/constants.dart';
// import 'package:auth_buttons/auth_buttons.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// String prettyPrint(Map json) {
//   JsonEncoder encoder = new JsonEncoder.withIndent('  ');
//   String pretty = encoder.convert(json);
//   return pretty;
// }
//
// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   Map<String, dynamic>? _userData;
//   AccessToken? _accessToken;
//   bool _checking = true;
//
//   @override
//   void initState() {
//     super.initState();
//     _checkIfIsLogged();
//   }
//
//   Future<void> _checkIfIsLogged() async {
//     final accessToken = await FacebookAuth.instance.accessToken;
//     setState(() {
//       _checking = false;
//     });
//     if (accessToken != null) {
//       print("is Logged:::: ${prettyPrint(accessToken.toJson())}");
//       // now you can call to  FacebookAuth.instance.getUserData();
//       final userData = await FacebookAuth.instance.getUserData();
//       // final userData = await FacebookAuth.instance.getUserData(fields: "email,birthday,friends,gender,link");
//       _accessToken = accessToken;
//       setState(() {
//         _userData = userData;
//       });
//     }
//   }
//
//   void _printCredentials() {
//     print(
//       prettyPrint(_accessToken!.toJson()),
//     );
//   }
//
//   Future<void> _login() async {
//     final LoginResult result = await FacebookAuth.instance.login(); // by the fault we request the email and the public profile
//
//     // loginBehavior is only supported for Android devices, for ios it will be ignored
//     // final result = await FacebookAuth.instance.login(
//     //   permissions: ['email', 'public_profile', 'user_birthday', 'user_friends', 'user_gender', 'user_link'],
//     //   loginBehavior: LoginBehavior
//     //       .DIALOG_ONLY, // (only android) show an authentication dialog instead of redirecting to facebook app
//     // );
//
//
//     if (result.status == LoginStatus.success) {
//       _accessToken = result.accessToken;
//       _printCredentials();
//       // get the user data
//       // by default we get the userId, email,name and picture
//       final userData = await FacebookAuth.instance.getUserData();
//       // final userData = await FacebookAuth.instance.getUserData(fields: "email,birthday,friends,gender,link");
//       _userData = userData;
//     } else {
//       print(result.status);
//       print(result.message);
//     }
//
//     setState(() {
//       _checking = false;
//     });
//   }
//
//
//   Future<void> _logOut() async {
//     await FacebookAuth.instance.logOut();
//     _accessToken = null;
//     _userData = null;
//     setState(() {});
//   }
//
//   // @override
//   // Widget build(BuildContext context) {
//   //   return MaterialApp(
//   //     home: Scaffold(
//   //       appBar: AppBar(
//   //         title: const Text('Facebook Auth Example'),
//   //       ),
//   //       body: _checking
//   //           ? Center(
//   //         child: CircularProgressIndicator(),
//   //       )
//   //           : SingleChildScrollView(
//   //         child: Padding(
//   //           padding: const EdgeInsets.all(8.0),
//   //           child: Column(
//   //             crossAxisAlignment: CrossAxisAlignment.center,
//   //             children: <Widget>[
//   //               Text(
//   //                 _userData != null ? prettyPrint(_userData!) : "NO LOGGED",
//   //               ),
//   //               SizedBox(height: 20),
//   //               _accessToken != null
//   //                   ? Text(
//   //                 prettyPrint(_accessToken!.toJson()),
//   //               )
//   //                   : Container(),
//   //               SizedBox(height: 20),
//   //               CupertinoButton(
//   //                 color: Colors.blue,
//   //                 child: Text(
//   //                   _userData != null ? "LOGOUT" : "LOGIN",
//   //                   style: TextStyle(color: Colors.white),
//   //                 ),
//   //                 onPressed: _userData != null ? _logOut : _login,
//   //               ),
//   //               SizedBox(height: 50),
//   //             ],
//   //           ),
//   //         ),
//   //       ),
//   //     ),
//   //   );
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     String email;
//     String password;
//     bool isLoading = false;
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Facebook Auth Example'),
//         ),
//         body: Center(
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: <Widget>[
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Align(
//                   alignment: Alignment.centerLeft,
//                   child: Container(
//                     margin: EdgeInsets.only(left: 20.0),
//                     child: Text(
//                       "Let's get Started",
//                       style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 50),
//                 GoogleAuthButton(
//                     onPressed: () {
//                       setState(() {
//                         isLoading = !isLoading;
//                       });
//                     },
//                   darkMode: false,
//                   isLoading: isLoading,
//                   style: AuthButtonStyle(
//                     iconSize: 24.0,
//                     borderRadius: 8.0,
//                     width: 280.0,
//                   ),
//                   //buttonType: buttonType;
//                 ),
//                 SizedBox(height: 10),
//                 FacebookAuthButton(
//                   onPressed: () {
//                     setState(() {
//                       isLoading = !isLoading;
//                     });
//                   },
//                   darkMode: false,
//                   isLoading: isLoading,
//                   style: AuthButtonStyle(
//                     iconSize: 24.0,
//                     width: 280.0,
//                     borderRadius: 8.0,
//                   ),
//                   //buttonType: buttonType;
//                 ),
//                 SizedBox(height: 10),
//                 AppleAuthButton(
//                   onPressed: () {
//                     setState(() {
//                       isLoading = !isLoading;
//                     });
//                   },
//                   darkMode: false,
//                   isLoading: isLoading,
//                   style: AuthButtonStyle(
//                     iconSize: 24.0,
//                     width: 280.0,
//                     borderRadius: 8.0,
//                   ),
//                   //buttonType: buttonType;
//                 ),
//                 SizedBox(height: 10),
//                 Align(
//                   alignment: Alignment.centerLeft,
//                   child: Container(
//                     margin: EdgeInsets.only(left: 20.0),
//                     child: Text(
//                       "OR",
//                       style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 50),
//                 TextField(
//                   keyboardType: TextInputType.emailAddress,
//                   textAlign: TextAlign.center,
//                   onChanged: (value) {
//                     email = value;
//                   },
//                   decoration:
//                   kTextFieldDecoration.copyWith(hintText: 'Enter your email'),
//                 ),
//                 SizedBox(
//                   height: 8.0,
//                 ),
//                 TextField(
//                   obscureText: true,
//                   textAlign: TextAlign.center,
//                   onChanged: (value) {
//                     password = value;
//                   },
//                   decoration: kTextFieldDecoration.copyWith(
//                       hintText: 'Enter your password'),
//                 ),
//               ],
//             ),
//           ),
//         )
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'login_screenfinal.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:login_final/interest_page.dart';

//void main() => runApp(MyApp());
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login UI',
      debugShowCheckedModeBanner: false,
      home: InterestPage(), //LoginScreenFinal(),//
    );
  }
}