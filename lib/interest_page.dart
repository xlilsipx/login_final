import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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




  var nameActivityList = <String>[];
  List<Widget> buttonsListUp = <Widget>[];
  List<Widget> buttonsListDown = <Widget>[];

  List<bool> _isSelected = List.generate(2, (_) => false);//siddha

  //add all hobbies accordingly and make more lists above
  void initState() {
    super.initState();
    nameActivityList.add('activity1');
    nameActivityList.add('activity1');
  }


  Widget _myListView(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 1.0),
          color: Colors.tealAccent,
          child: Text('$index'),
        );
      },
    );
  }

  List<Widget> _buildButtonsListWithActivitiesUp () {
    for (int i=0; i < nameActivityList.length; i++) {
      buttonsListUp.add(_buildInterestCard(nameActivityList[i]));
    }
    return buttonsListUp;
  }
  List<Widget> _buildButtonsListWithActivitiesDown () {
    for (int i=0; i < nameActivityList.length; i++) {
      buttonsListDown.add(_buildInterestCard(nameActivityList[i]));
    }
   buttonsListDown.insert(0, SizedBox(width: 50,),);
    return buttonsListDown;
  }



  @override


  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('interests'),
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
                      "Deine Dummen Hobbies",
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(height: 50),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.only(left: 20.0),
                    child: Text(
                      "Hobby gruppe 1",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                            ToggleButtons(children: [
                              Text('some'),
                              Icon(Icons.add_location),
                            ],
                              isSelected: _isSelected,
                              onPressed: (int index) {
                                setState(() {
                                  _isSelected[index] = !_isSelected[index];
                                });
                              },
                              ),
                            // Row(
                            //   children: _buildButtonsListWithActivitiesUp(),
                            // ),

                            // Row(
                            //   children: _buildButtonsListWithActivitiesDown(),
                            // ),
                            // ListView.builder(itemBuilder: (context, index) {
                            //   return ListTile(
                            //     title: Text(''),
                            //   )
                            // })
                          ],
                        ),
                      )


                    ]
                  ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.only(left: 20.0),
                    child: Text(
                      "Hobby gruppe 2",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

                Column(
                    children: <Widget>[
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: [
                                _buildInterestCard('activity32q1'),
                                _buildInterestCard('activity1e'),
                                _buildInterestCard('activity31'),
                                _buildInterestCard('activity15'),
                                _buildInterestCard('activity16'),
                                _buildInterestCard('activity32q1'),
                                _buildInterestCard('activity1e'),
                                _buildInterestCard('activity31'),
                                _buildInterestCard('activity15'),
                                _buildInterestCard('activity16'),
                              ],
                            ),

                            Row(
                              children: [
                                const SizedBox(width: 50,),
                                _buildInterestCard('activity32q1'),
                                _buildInterestCard('activity1e'),
                                _buildInterestCard('activity31'),
                                _buildInterestCard('activity15'),
                                _buildInterestCard('activity16'),
                                _buildInterestCard('activity32q1'),
                                _buildInterestCard('activity1e'),
                                _buildInterestCard('activity31'),
                                _buildInterestCard('activity15'),
                                _buildInterestCard('activity16'),
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
        ));
  }
}
