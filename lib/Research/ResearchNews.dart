import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:usp_mobileapp/Research/news.dart';

class ResearchNews extends StatefulWidget {
  @override
  _ResearchNews createState() => _ResearchNews();
}

class _ResearchNews extends State<ResearchNews> {
  var Name;
  var Desc;
  var alldata = new Map();

  void setupGetAre() async {
    GetAreaData instance = GetAreaData(); //change this school later

    alldata = await instance.getData();
    if (alldata.length == 0) {
      setState(() {
        Name = "No Data Found";
        print("No Data");
      });
    } else {
      for (var i = 0; i < alldata.length; i++) {
        setState(() {
          // set correct keps
          Name = alldata[i]["news_name"];
          Desc = alldata[i]["news_desc"];
        });
      }
    }

    // print(alldata);
  }

//Uncomment bottom part when API is ready
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
            "Research News",
            style: new TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Color.fromRGBO(0, 163, 163, 1),
        ),
        body: ListView(
          children: [
            if (Name == "No Data Found") Text(Name),
            for (var i = 0; i < alldata.length; i++)
              News(
                alldata[i]["news_name"],
                alldata[i]["news_desc"],
              ),
          ],
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
      onTap: () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => Story(Name, Desc)));
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
                    // ExpansionTile(
                    //   title: const Text('Story...'),
                    //   subtitle: Text('Click to View Story'),
                    //   children: [
                    //     Text(
                    //       "$Desc",
                    //       style: new TextStyle(
                    //           fontSize: 15,
                    //           fontWeight: FontWeight.normal,
                    //           color: Color.fromRGBO(212, 241, 244, 1)),
                    //       textAlign: TextAlign.justify,
                    //     )
                    //   ],
                    // )
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
      final Uri url = Uri.parse(BaseURL + 'researchnews/'); //get correct path
      http.Response response = await http.get(url);
      List data = json.decode(response.body);
      // print(data);
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
