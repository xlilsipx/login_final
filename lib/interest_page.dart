import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:login_final/constants.dart';
import 'package:auth_buttons/auth_buttons.dart';

//import 'package:login_final/authentication_Final.dart';
import 'dart:convert';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:login_final/user_data_page.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';




class InterestPage extends StatefulWidget {
  @override
  _InterestPageState createState() => _InterestPageState();
}

class _InterestPageState extends State<InterestPage> {



  Widget _buildInterestCard(String activity) {
    bool selected = false;
    return Container(
      child: Row(
        children: [
          ElevatedButton(
            onPressed: () {
              setState(() {
                selected = !selected;
              });
            },
            child: Text(
              activity,
            ),
            style: selected ? kElevatedButtonActivityStyleActive : kElevatedButtonActivityStyleInactive,
          ),
          const SizedBox(width: 10,),
        ],
      ),
    );
  }



  //TODO:toggleButton ist hier die Lösung






  List<String> activityNameList1 = <String>[
    'some activity1',
    'some activity1',
    'some activity1',
    'some activity1',
  ];
  List<bool> _isSelected1 = List.generate(4, (_) => false);

  List<String> activityNameList2 = <String>[
    'some activity2',
    'some activity2',
    'some activity2',
    'some activity2',
  ];
  List<bool> _isSelected2 = List.generate(4, (_) => false);

  List<String> activityNameList3 = <String>[
    'some activity3',
    'some activity3',
    'some activity3',
    'some activity3',
  ];
  List<bool> _isSelected3 = List.generate(4, (_) => false);

  List<String> activityNameList4 = <String>[
    'some activity4',
    'some activity4',
    'some activity4',
    'some activity4',
  ];
  List<bool> _isSelected4 = List.generate(4, (_) => false);

  //add all hobbies accordingly and make more lists above
  // void initState() {
  //   super.initState();
  //   nameActivityList.add('activity1');
  //   nameActivityList.add('activity1');
  // }


  // Widget _myListView(BuildContext context) {
  //   return ListView.builder(
  //     scrollDirection: Axis.horizontal,
  //     itemBuilder: (context, index) {
  //       return Container(
  //         margin: const EdgeInsets.symmetric(horizontal: 1.0),
  //         color: Colors.tealAccent,
  //         child: Text('$index'),
  //       );
  //     },
  //   );
  // }

  // List<Widget> _buildButtonsListWithActivitiesUp () {
  //   for (int i=0; i < nameActivityList.length; i++) {
  //     buttonsListUp.add(_buildInterestCard(nameActivityList[i]));
  //   }
  //   return buttonsListUp;
  // }
  // List<Widget> _buildButtonsListWithActivitiesDown () {
  //   for (int i=0; i < nameActivityList.length; i++) {
  //     buttonsListDown.add(_buildInterestCard(nameActivityList[i]));
  //   }
  //  buttonsListDown.insert(0, SizedBox(width: 50,),);
  //   return buttonsListDown;
  // }

  // List<bool> _isSelected = [false, false, false, false,];


  // Widget ActivityFinal() {
  //   return Container(
  //     height: 40,
  //     color: Colors.white,
  //     child: GridView.count(
  //       crossAxisCount: 3,
  //       childAspectRatio: 1.0,
  //       padding: const EdgeInsets.all(4.0),
  //       mainAxisSpacing: 4.0,
  //       crossAxisSpacing: 4.0,
  //       children: List.generate(isSelected.length, (index) {
  //         return ElevatedButton(
  //             onPressed: () {
  //               setState(() {
  //                 for (int indexBtn = 0;
  //                 indexBtn < isSelected.length;
  //                 indexBtn++) {
  //                   if (indexBtn == index) {
  //                     isSelected[indexBtn] = !isSelected[indexBtn];
  //                   }
  //                 }
  //               });
  //         },
  //             child: Text(
  //               testList2[index],
  //             ),
  //           style: isSelected[index] ? kElevatedButtonActivityStyleActive : kElevatedButtonActivityStyleInactive,);
  //       }),
  //     ),
  //   );
  // }


  Widget _buildInterestCard2(List activityName, List _isSelected) {
    return Container(
      child: Row(
        children: List.generate(_isSelected.length, (index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  for (int indexBtn = 0;
                  indexBtn < _isSelected.length;
                  indexBtn++) {
                    if (indexBtn == index) {
                      _isSelected[indexBtn] = !_isSelected[indexBtn];
                    }
                  }
                });
              },
              child: Text(
                activityName[index],
              ),
              style: _isSelected[index] ? kElevatedButtonActivityStyleActive : kElevatedButtonActivityStyleInactive,
            ),
          );
        },
        ),
      ),
    );
  }

  // Widget ActivityList() {
  //   return Ink(
  //     width: 400,
  //     height: 20,
  //     color: Colors.white,
  //     child: GridView.count(
  //
  //      // primary: true,
  //       crossAxisCount: 3, //set the number of buttons in a row
  //       crossAxisSpacing: 8, //set the spacing between the buttons
  //       mainAxisSpacing: 4.0,
  //       padding: const EdgeInsets.all(4.0),
  //       childAspectRatio: 1, //set the width-to-height ratio of the button,
  //       //>1 is a horizontal rectangle
  //       children: List.generate(isSelected.length, (index) {
  //         //using inkwell widget ti make button
  //         return InkWell(
  //           splashColor: Colors.yellow,
  //           onTap: () {
  //             setState(() {
  //               for (int indexBtn = 0;
  //               indexBtn < isSelected.length;
  //               indexBtn++) {
  //                 if (indexBtn == index) {
  //                   isSelected[indexBtn] = !isSelected[indexBtn];//true;
  //                 }
  //               }
  //             });
  //           },
  //           child: Align(
  //             alignment: Alignment.centerLeft,
  //             child: Ink(
  //               decoration: BoxDecoration(
  //                 //set the background color of the button when it is selected/ not selected
  //                 color: isSelected[index] ? Color(0xffD6EAF8) : Colors.blue,
  //                 // here is where we set the rounded corner
  //                 borderRadius: BorderRadius.circular(8),
  //                 //don't forget to set the border,
  //                 //otherwise there will be no rounded corner
  //                 border: Border.all(color: Colors.red),
  //               ),
  //               child: testList[index],
  //             ),
  //           ),
  //         );
  //       }),
  //     ),
  //   );
  // }



  @override


  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // SizedBox(
                //   height: 20,
                // ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.only(left: 20.0),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        "Tap your interests to \nfind tailored \nactivities",
                        style:
                            TextStyle(fontSize: 30,),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 50),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.only(left: 20.0),
                    child: Center(
                      child: Text(
                        "Hobby gruppe 1",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                //hier neue widgets
                  Column(
                    children: <Widget>[
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Column(
                          children: <Widget>[
                            _buildInterestCard2(activityNameList1,_isSelected1),
                            Row(
                              children: [
                                SizedBox(width: 40),
                                _buildInterestCard2(activityNameList2, _isSelected2),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20,),
                    ]
                  ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.only(left: 20.0),
                    child: Center(
                      child: Text(
                        "Hobby gruppe 2",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),

                Column(
                    children: <Widget>[
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Column(
                          children: <Widget>[
                            _buildInterestCard2(activityNameList3, _isSelected3),
                            Row(
                              children: [
                                SizedBox(width: 40),
                                _buildInterestCard2(activityNameList4, _isSelected4),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20,),
                    ]
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.only(left: 20.0),
                    child: Center(
                      child: Text(
                        "Hobby gruppe 3",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Column(
                    children: <Widget>[
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Column(
                          children: <Widget>[
                            _buildInterestCard2(activityNameList3, _isSelected3),
                            Row(
                              children: [
                                SizedBox(width: 40),
                                _buildInterestCard2(activityNameList4, _isSelected4),
                              ],
                            ),
                          ],
                        ),
                      )
                    ]
                ),
              ],
            ),
          ),
        ),
    bottomNavigationBar: Padding(
      padding: EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {},
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
          ),
        // color:Colors.blue,
        // textColor: Colors.white,
        child: Text('next button')
      ),
    ));
  }
}
