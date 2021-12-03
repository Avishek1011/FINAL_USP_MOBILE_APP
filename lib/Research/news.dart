import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Story extends StatefulWidget {
  Story(this.name, this.description);
  var name;
  var description;
  @override
  _Story createState() => _Story(name, description);
}

class _Story extends State<Story> {
  _Story(this.name, this.description);
  var name;
  var description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Research News",
            style: new TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Color.fromRGBO(0, 163, 163, 1),
        ),
        body: ListView(
          children: [News(name, description)],
        ));
  }
}

class News extends StatelessWidget {
  News(this.Name, this.Desc);
  var Name;
  var Desc;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
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
              Padding(
                  padding: EdgeInsets.fromLTRB(16.0, 16, 16.0, 16.0),
                  child: Column(children: [
                    Text("$Name",
                        style: new TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(212, 241, 244, 1))),
                    SizedBox(
                      height: 10,
                    ),
                    const Divider(
                      height: 20,
                      thickness: 5,
                      indent: 20,
                      endIndent: 20,
                      color: Colors.amber,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("$Desc",
                        style: new TextStyle(
                            fontSize: 20,
                            color: Color.fromRGBO(212, 241, 244, 1)))
                  ])),
            ],
          ),
        ),
      ),
    );
  }
}
