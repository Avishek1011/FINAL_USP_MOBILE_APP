import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SuccessStories extends StatefulWidget {
  @override
  _SuccessStories createState() => _SuccessStories();
}

class _SuccessStories extends State<SuccessStories> {
  var Name;
  var Desc;
  var Image;

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
          Name = alldata[i]["Name"];
          Desc = alldata[i]["Desc"];
          Image = alldata[i]["Image"];
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
            "Success Stories",
            style: new TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Color.fromRGBO(0, 163, 163, 1),
        ),
        body: ListView(
          children: [
            for (var i = 0; i < 2; i++) Stories(),
            // alldata[i]["Name"],
            // alldata[i]["Desc"],
            // alldata[i]["Image"]),
          ],
        ));
  }
}

class Stories extends StatelessWidget {
  // Stories(this.Name, this.Desc, this.Image);
  // var Name;
  var Desc =
      "The first trailer for Eternals was light on story details. but the final trailer reveals a lot more, so here's everything we know about the plot of Marvel Studios' upcoming Phase Four movie. Following the conclusion of the Infinity Saga, the Marvel Cinematic Universe is evolving in some surprising directions. There are plenty of familiar characters returning to the spotlight in movies and Disney+ shows, but Marvel is also launching new potential franchises. The MCU has several well-known characters who they can still bring to the screen, but Eternals will put another obscure comic team front and center - several years after the risk of Guardians of the Galaxy paid off.With general audiences having less familiarity with the Eternals characters, Marvel has made up some ground by assembling an incredible collection of talent to bring the concept to life. Eternals is directed by Chloé Zhao, who is now an Oscar-winning director (for Nomadland), and she's infused the film with a different visual style than past MCU adventures. Gemma Chan leads the diverse cast as Sersi, one of the superhuman beings known as Eternals. She's joined by Angelina Jolie's Thena, Salma Hayek's Ajak, Richard Madden's Ikaris, Kumail Nanjiani's Kingo, Brian Tyree Henry's Phastos, and more. Their involvement raised interest level in Eternals and is one reason why so many fans are intrigued to see what it holds.";
  // var Image;

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
                    Text("Person Name",
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
                          "$Desc",
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
      final Uri url = Uri.parse(BaseURL + 'successstories/'); //get correct path
      http.Response response = await http.get(url);
      List data = json.decode(response.body);
      print(data);
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
