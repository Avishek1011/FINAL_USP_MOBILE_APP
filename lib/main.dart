import 'package:flutter/material.dart';
// import 'package:http/http.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:usp_mobileapp/DigitalBoardHome.dart';
import 'package:usp_mobileapp/ResearchHome.dart';
import 'package:usp_mobileapp/Research/ResearchNews.dart';
import 'package:usp_mobileapp/loadingscreen.dart';
import 'package:usp_mobileapp/security_main.dart';

import 'e&ideskmenus.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/splash',
      routes: {
        // '/': (context) => Loading(),
        '/splash': (context) => MyApp(),
        '/bottom': (context) => Home(),
        '/researchhome': (context) => ResearchHome(),
        '/digitalnotice': (context) => DigitalBoardHome(),
      },
    ));

class Home extends StatefulWidget {
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "USP APP",
          style: new TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromRGBO(0, 163, 163, 1),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 1,
        height: 60.0,
        items: <Widget>[
          IconButton(
            icon: Icon(Icons.assignment),
            iconSize: 30,
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => ResearchHome()));
            },
          ),
          IconButton(
            icon: Icon(Icons.home),
            iconSize: 30,
            onPressed: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Home()));
            },
          ),
          IconButton(
            icon: Icon(Icons.campaign),
            iconSize: 30,
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => DigitalBoardHome()));
            },
          ),
        ],
        color: Color.fromRGBO(0, 163, 163, 1),
        buttonBackgroundColor: Colors.white,
        backgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {},
        letIndexChange: (index) => true,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [


          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ResearchNews()));
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 20,
              shadowColor: Color.fromRGBO(113, 213, 228, 1),
              color: Color.fromRGBO(24, 154, 180, 1),
              child: Container(
                // height: 300.0,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16.0),
                            topRight: Radius.circular(16.0)),
                        child: Image.asset(
                          "images\\office.jpg",
                        )),
                    Padding(
                        padding: EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
                        child: Column(children: [
                          Text("Research & Innovation News",
                              style: new TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(212, 241, 244, 1))),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Click here to view recent news and notifications from the Research and Innovation ",
                            style: new TextStyle(
                                fontSize: 15, color: Colors.white),
                            textAlign: TextAlign.center,
                          )
                        ])),
                  ],
                ),
              ),
            ),
          ),


          SizedBox(
            height: 30,
          ),


          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DigitalBoardHome()));
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 20,
              shadowColor: Color.fromRGBO(113, 213, 228, 1),
              color: Color.fromRGBO(5, 68, 94, 1),
              child: Container(
                // height: 150.0,
                child: Column(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16.0),
                            topRight: Radius.circular(16.0)),
                        child: Image.asset(
                          "images\\db.jpg",
                        )),
                    Padding(
                        padding: EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
                        child: Column(children: [
                          Text("Digital Notice Board",
                              style: new TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(212, 241, 244, 1))),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Click here to view recent news and notices from the Digital Notice Board",
                            style: new TextStyle(
                                fontSize: 15, color: Colors.white),
                            textAlign: TextAlign.center,
                          )
                        ])),
                  ],
                ),
              ),
            ),
          ),



          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Securitypage()));
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 20,
              shadowColor: Color.fromRGBO(113, 213, 228, 1),
              color: Color.fromRGBO(0, 163, 163, 1),
              child: Container(
                // height: 150.0,
                child: Column(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16.0),
                            topRight: Radius.circular(16.0)),
                        child: Image.asset(
                          "images\\securityhome.jpg",
                        )),
                    Padding(
                        padding: EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
                        child: Column(children: [
                          Text("Security",
                              style: new TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(212, 241, 244, 1))),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Click here to send the alert / danger location to security ",
                            style: new TextStyle(
                                fontSize: 15, color: Colors.white),
                            textAlign: TextAlign.center,
                          )
                        ])),
                  ],
                ),
              ),
            ),
          ),


          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => menus()));
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 20,
              shadowColor: Color.fromRGBO(113, 213, 228, 1),
              color: Color.fromRGBO(0, 163, 163, 1),
              child: Container(
                // height: 150.0,
                child: Column(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16.0),
                            topRight: Radius.circular(16.0)),
                        child: Image.asset(
                          "images\\e&i.jpg",
                        )),
                    Padding(
                        padding: EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
                        child: Column(children: [
                          Text("Security",
                              style: new TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(212, 241, 244, 1))),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Click here to navigate to the E&I page for Issue reporting , Dismac Materials , OHS AND Contacts ",
                            style: new TextStyle(
                                fontSize: 15, color: Colors.white),
                            textAlign: TextAlign.center,
                          )
                        ])),
                  ],
                ),
              ),
            ),
          ),


        ],
      ),
    );
  }
}
