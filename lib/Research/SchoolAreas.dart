import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:usp_mobileapp/Research/ExpressionOfInterest.dart';

class SchoolArea extends StatefulWidget {
  SchoolArea(this.school);
  String school;
  @override
  _SchoolArea createState() => _SchoolArea(school);
}

class _SchoolArea extends State<SchoolArea> {
  _SchoolArea(this.school);
  var school;
  var name;
  // var area;
  // var description;
  // var discipline;
  // var supervisor;
  // var supervisor_contact;
  // var scholarship;

  var alldata = new Map();

  void setupGetAre() async {
    // print(school);
    GetAreaData instance = GetAreaData(school); //change this school later

    alldata = await instance.getData();
    if (alldata.length == 0) {
      setState(() {
        name = "No Data Found";
        print("No Data");
      });
    } else {
      for (var i = 0; i < alldata.length; i++) {
        setState(() {
          name = alldata[i]["name"];
          // area = alldata[i]["area"];
          // description = alldata[i]["description"];
          // discipline = alldata[i]["discipline"];
          // supervisor = alldata[i]["supervisor"];
          // supervisor_contact = alldata[i]["supervisor_contact"];
          // scholarship = alldata[i]["scholarship"];
        });
      }
    }

    // print(alldata);
  }

  @override
  void initState() {
    super.initState();
    setupGetAre();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Research Area",
          style: new TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromRGBO(0, 163, 163, 1),
      ),
      body: ListView(
        children: [
          if (name == "No Data Found") Text(name),
          for (var i = 0; i < alldata.length; i++)
            ResearchAreaCards(alldata[i]["r_topic"]
                // alldata[i]["sch"],
                // alldata[i]["description"],
                // alldata[i]["discipline"],
                // alldata[i]["supervisor"],
                // alldata[i]["supervisor_contact"],
                // alldata[i]["scholarship"]
                )
        ],
      ),
    );
  }
}

class ResearchAreaCards extends StatelessWidget {
  ResearchAreaCards(this.name);
  // , this.area, this.description, this.discipline,
  //     this.supervisor, this.supervisor_contact, this.scholarship
  // );
  final String name;
  // String area;
  // String description;
  // String discipline;
  // String supervisor;
  // int supervisor_contact;
  // String scholarship;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SendApplication(name)),
        );
      },
      child: Container(
        height: 75.0,
        width: double.infinity,
        child: Card(
            color: Colors.cyan[700],
            margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: ListView(
                children: [
                  Text(name,
                      style: new TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold)),
                  // Text(area,
                  //     style: new TextStyle(
                  //         fontSize: 15, fontWeight: FontWeight.bold)),
                  // Text(description,
                  //     style: new TextStyle(
                  //         fontSize: 15, fontWeight: FontWeight.bold)),
                  // Text(discipline,
                  //     style: new TextStyle(
                  //         fontSize: 15, fontWeight: FontWeight.bold)),
                  // Text(supervisor,
                  //     style: new TextStyle(
                  //         fontSize: 15, fontWeight: FontWeight.bold)),
                  // Text(supervisor_contact.toString(),
                  //     style: new TextStyle(
                  //         fontSize: 15, fontWeight: FontWeight.bold)),
                  // Text(scholarship,
                  //     style: new TextStyle(
                  //         fontSize: 15, fontWeight: FontWeight.bold)),
                  Text("Expression of Interest",
                      style: new TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.right),
                ],
              ),
            )),
      ),
    );
  }
}

class GetAreaData {
  GetAreaData(this.schname);

  String schname;
  String name = 'loading..';
  String area = 'loading..';
  String description = 'loading..';
  String discipline = 'loading..';
  String supervisor = 'loading..';
  int supervisor_contact = 0;
  String scholarship = 'loading..';

  Future<Map> getData() async {
    var alldata = new Map();
    try {
      final String BaseURL = 'http://127.0.0.1:8000/api/';
      final Uri url = Uri.parse(BaseURL + 'researcharea/');
      http.Response response = await http.get(url);
      List data = json.decode(response.body);
      // print(data.length);
      for (var i = 0; i < data.length; i++) {
        // print(data[i]);
        if (data[i]["sch_name"] == schname) {
          alldata[i] = data[i];
        }
      }

      return alldata;
    } catch (err) {
      print(err);
    }
    return alldata;
  }
}
