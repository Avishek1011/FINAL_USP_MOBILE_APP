import 'dart:async';
import 'package:flutter/material.dart';
// import 'package:usp_app/main.dart';
import 'package:usp_mobileapp/loginscreen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 2),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MyLogin())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0)),
            child: Image.asset(
              "images\\logo.jpg",
            )));
    // child: FlutterLogo(size: MediaQuery.of(context).size.height));
  }
}
