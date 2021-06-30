import 'login_screenfinal.dart';
import 'package:flutter/material.dart';
import 'package:login_final/constants.dart';
import 'package:auth_buttons/auth_buttons.dart';
//import 'package:login_final/authentication_Final.dart';
import 'dart:convert';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:login_final/user_data_page.dart';


//TODO: make userdata access token private again
import 'package:flutter/cupertino.dart';


class UserDataPage extends StatelessWidget {
 // const UserDataPage({Key? key}) : super(key: key);

  UserDataPage({@required this.userData, @required this.accessToken});
  Map<String, dynamic>? userData;
  AccessToken? accessToken;

    String prettyPrint(Map json) {
    JsonEncoder encoder = new JsonEncoder.withIndent('  ');
    String pretty = encoder.convert(json);
    return pretty;
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          userData != null ? prettyPrint(userData!) : "NO LOGGED",
        ),
        SizedBox(height: 20),
        accessToken != null
            ? Text(
          prettyPrint(accessToken!.toJson()),
        )
            : Container(),
        SizedBox(height: 20),
        // CupertinoButton(
        //   color: Colors.blue,
        //   child: Text(
        //     userData != null ? "LOGOUT" : "LOGIN",
        //     style: TextStyle(color: Colors.white),
        //   ),
        //   onPressed: userData != null ? _logOut : _login,
        // ),
      ],
    );
  }
}


//
// class UserDataPage extends StatefulWidget {
//
//   UserDataPage({@required this.userData, @required this.accessToken})
//
//
//   @override
//   _UserDataPageState createState() => _UserDataPageState();
// }
//
//
//
// class _UserDataPageState extends State<UserDataPage> {
//
//
//   String prettyPrint(Map json) {
//     JsonEncoder encoder = new JsonEncoder.withIndent('  ');
//     String pretty = encoder.convert(json);
//     return pretty;
//   }
//
//   Map<String, dynamic>? userData;
//   AccessToken? accessToken;
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: <Widget>[
//         Text(
//           userData != null ? prettyPrint(userData!) : "NO LOGGED",
//         ),
//         SizedBox(height: 20),
//         accessToken != null
//             ? Text(
//           prettyPrint(accessToken!.toJson()),
//         )
//             : Container(),
//         SizedBox(height: 20),
//         // CupertinoButton(
//         //   color: Colors.blue,
//         //   child: Text(
//         //     userData != null ? "LOGOUT" : "LOGIN",
//         //     style: TextStyle(color: Colors.white),
//         //   ),
//         //   onPressed: userData != null ? _logOut : _login,
//         // ),
//         SizedBox(height: 50),
//       ],
//     );
//   }
// }
//
