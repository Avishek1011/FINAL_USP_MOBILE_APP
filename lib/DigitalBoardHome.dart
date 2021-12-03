import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:usp_mobileapp/main.dart';
import 'package:usp_mobileapp/DigitalNotices/RequestPublish.dart';
import 'package:usp_mobileapp/DigitalNotices/imagepicker.dart';
import 'package:usp_mobileapp/ResearchHome.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DigitalBoardHome extends StatefulWidget {
  @override
  _DigitalBoardHome createState() => _DigitalBoardHome();
}

class _DigitalBoardHome extends State<DigitalBoardHome> {
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  var Name;
  var Desc;
  var category;
  var image;
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
          Name = alldata[i]["Nmae"];
          Desc = alldata[i]["Desc"];
          category = alldata[i]["catgory"];
          image = alldata[i]["image"];
        });
      }
    }

    // print(alldata);
  }
//Uncomment bottom part when API is ready
  // @override
  // void initState() {
  //   super.initState();
  //   setupGetAre();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "DIGITAL NOTICE BOARD",
          style: new TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromRGBO(0, 163, 163, 1),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 2,
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
        children: [
          for (var i = 0; i < 2; i++) News(),
          // alldata[i]["Name"],
          // alldata[i]["Desc"],
          // alldata[i]["Image"],
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        // isExtended: true,
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RequestPublish()),
          );
        },
      ),
    );
  }
}

class News extends StatelessWidget {
  // Stories(this.Name, this.Desc, this.Image);
  // var Name;
  // var Desc =

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
              ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.0),
                      topRight: Radius.circular(16.0)),
                  child: Image.asset(
                    "images\\office.jpg",
                  )),
              Padding(
                  padding: EdgeInsets.fromLTRB(16.0, 16, 16.0, 16.0),
                  child: Column(children: [
                    Text("Story Title",
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
                    ExpansionTile(
                      title: const Text('Story...'),
                      subtitle: Text('Click to View Story'),
                      children: [
                        Text(
                          "Story : by Author Name",
                          style: new TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: Color.fromRGBO(212, 241, 244, 1)),
                          textAlign: TextAlign.justify,
                        )
                      ],
                    )
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
