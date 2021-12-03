import 'package:flutter/material.dart';
// import 'package:http/http.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:usp_mobileapp/DigitalBoardHome.dart';
import 'package:usp_mobileapp/ResearchHome.dart';

class Scholarships extends StatefulWidget {
  @override
  _Scholarships createState() => _Scholarships();
}

class _Scholarships extends State<Scholarships> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Scholarships",
          style: new TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromRGBO(0, 163, 163, 1),
      ),
    );
  }
}
