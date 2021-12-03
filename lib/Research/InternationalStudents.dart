import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class InternationalStudents extends StatefulWidget {
  @override
  _InternationalStudents createState() => _InternationalStudents();
}

class _InternationalStudents extends State<InternationalStudents> {
  var Link;
  var alldata = new Map();

  void setupGetAre() async {
    GetAreaData instance = GetAreaData(); //change this school later

    alldata = await instance.getData();
    if (alldata.length == 0) {
      setState(() {
        Link = "No Data Found";
        print("No Data");
      });
    } else {
      for (var i = 0; i < alldata.length; i++) {
        setState(() {
          // set correct keps
          Link = alldata[i]["Link"];
        });
      }
    }

    // print(alldata);
  }

//Uncomment bottom part when API is ready
  @override
  void initState() {
    super.initState();
    //setupGetAre();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "International Students",
          style: new TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromRGBO(0, 163, 163, 1),
      ),
      body: ListView(
        children: [
          for (var i = 0; i < 2; i++) Sites(),
          // alldata[i]["Name"],
          // alldata[i]["Desc"],
          // alldata[i]["Image"]),
        ],
      ),
    );
  }
}

class Sites extends StatelessWidget {
  // Stories(this.Name, this.Desc, this.Image);
  // var Link;

  _launchURLBrowser() async {
    const url = 'https://flutterdevs.com/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchURLApp() async {
    print("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAHHHHHHHHHHHH");
    const url = 'https://flutterdevs.com/';
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: true, forceWebView: true);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _launchURLBrowser();
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
              Padding(
                  padding: EdgeInsets.fromLTRB(16.0, 16, 16.0, 16.0),
                  child: Column(children: [
                    Text("Site Name",
                        style: new TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(212, 241, 244, 1))),
                    SizedBox(
                      height: 10,
                    ),
                  ])),
            ],
          ),
        ),
      ),
    );
  }
}

class GetAreaData {
  var Name;
  var Desc;
  var Image;

  Future<Map> getData() async {
    var alldata = new Map();
    try {
      final String BaseURL = 'http://127.0.0.1:8000/api/';
      final Uri url = Uri.parse(BaseURL + 'Stoires/'); //get correct path
      http.Response response = await http.get(url);
      List data = json.decode(response.body);

      for (var i = 0; i < data.length; i++) {
        alldata[i] = data[i];
      }

      return alldata;
    } catch (err) {
      print(err);
    }
    return alldata;
  }
}
