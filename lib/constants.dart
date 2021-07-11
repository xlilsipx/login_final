import 'package:flutter/material.dart';

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

final kHintTextStyle = TextStyle(
  color: Colors.grey,
  fontFamily: 'OpenSans',
);

final kLabelStyle = TextStyle(
  color: Color(0xffEBF3FF),
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

final kBoxDecorationStyle = BoxDecoration(
  color: Color(0xffEBF3FF),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);

final kElevatedButtonActivityStyleInactive = ButtonStyle(
  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0))),
  backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
);

final kElevatedButtonActivityStyleActive = ButtonStyle(
  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0))),
  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
);

final kTextSectionColor = Color(0xffEBF3FF);
final kRegisterButtonColor = Color(0xffD6317D);
final kLogInButtonColor = Color(0xff67E3DA);