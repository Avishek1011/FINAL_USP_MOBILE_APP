import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Grants extends StatefulWidget {
  @override
  _Grants createState() => _Grants();
}

class _Grants extends State<Grants> {
  var name;
  var duration;
  var amount;

  var alldata = new Map();

  void setupGetAre() async {
    GetAreaData instance = GetAreaData(); //change this school later

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
          duration = alldata[i]["duration"];
          amount = alldata[i]["amount"];
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
          "External Research Grants",
          style: new TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromRGBO(0, 163, 163, 1),
      ),
      body: ListView(
        children: [
          if (name == "No Data Found") Text(name),
          for (var i = 0; i < alldata.length; i++)
            GrantCards(alldata[i]["e_grant_name"],
                alldata[i]["e_grant_duration"], alldata[i]["e_grant_amount"])
        ],
      ),
    );
  }
}

class GrantCards extends StatelessWidget {
  GrantCards(this.name, this.duration, this.amount);
  var name;
  var duration;
  var amount;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 110.0,
        width: double.infinity,
        child: Card(
            color: Colors.cyan[700],
            margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: ListView(
                children: [
                  Row(
                    children: [
                      Text("Grant Name : $name",
                          style: new TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      SizedBox(
                        width: 50,
                      ),
                      Text("Grant Duration : $duration months",
                          style: new TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.right),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Grant Amount:  FJD $amount",
                      style: new TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold))
                ],
              ),
            )),
      ),
    );
  }
}

class GetAreaData {
  String name = 'loading..';
  String duration = 'loading..';
  String amount = 'loading..';

  Future<Map> getData() async {
    var alldata = new Map();
    try {
      final String BaseURL = 'http://127.0.0.1:8000/api/';
      final Uri url = Uri.parse(BaseURL + 'externalgrants/');
      http.Response response = await http.get(url);
      List data = json.decode(response.body);
      // print(data);
      for (var i = 0; i < data.length; i++) {
        alldata[i] = data[i];
        // print('yes');
      }

      return alldata;
    } catch (err) {
      print(err);
    }
    return alldata;
  }
}
