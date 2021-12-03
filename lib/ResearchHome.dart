import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:usp_mobileapp/main.dart';
import 'package:usp_mobileapp/DigitalBoardHome.dart';
import 'package:usp_mobileapp/Research/ExternalResearchGrants.dart';
import 'package:usp_mobileapp/Research/InternationalStudents.dart';
import 'package:usp_mobileapp/Research/ResearchArea.dart';
import 'package:usp_mobileapp/Research/ResearchNews.dart';
import 'package:usp_mobileapp/Research/Scholarships.dart';
import 'package:usp_mobileapp/Research/SuccessStories.dart';
import 'package:usp_mobileapp/Research/Support.dart';

class ResearchHome extends StatefulWidget {
  @override
  _ResearchHome createState() => _ResearchHome();
}

class _ResearchHome extends State<ResearchHome> {
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "RESEARCH & INNOVATION",
          style: new TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromRGBO(0, 163, 163, 1),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
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
      body: GridList(),
    );
  }
}

class GridList extends StatelessWidget {
  const GridList({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding:
              EdgeInsets.only(left: 16.0, top: 16.0, bottom: 16.0, right: 16.0),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ResearchArea()));
                },
                child: Card(
                  color: Colors.white,
                  elevation: 2.0,
                  child: SizedBox(
                    width: double.infinity,
                    height: 100.0,
                    child: Row(children: [
                      SizedBox(
                        height: 80,
                        width: 100,
                        child: Padding(
                          padding: EdgeInsets.only(left: 16.0),
                          child: Card(
                            color: Colors.amber[600],
                            child: Icon(
                              Icons.polymer,
                              size: 60.0,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Text("Research Areas",
                              overflow: TextOverflow.ellipsis,
                              softWrap: false,
                              maxLines: 2,
                              style: new TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black))),
                    ]),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SuccessStories()));
                },
                child: Card(
                  color: Colors.white,
                  elevation: 2.0,
                  child: SizedBox(
                    width: double.infinity,
                    height: 100.0,
                    child: Row(children: [
                      SizedBox(
                        height: 80,
                        width: 100,
                        child: Padding(
                          padding: EdgeInsets.only(left: 16.0),
                          child: Card(
                            color: Colors.purple[600],
                            child: Icon(
                              Icons.polymer,
                              size: 60.0,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text("Success Stories",
                              overflow: TextOverflow.ellipsis,
                              softWrap: false,
                              maxLines: 2,
                              style: new TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)))
                    ]),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Grants()));
                },
                child: Card(
                  color: Colors.white,
                  elevation: 2.0,
                  child: SizedBox(
                    width: double.infinity,
                    height: 100.0,
                    child: Row(children: [
                      SizedBox(
                        height: 80,
                        width: 100,
                        child: Padding(
                          padding: EdgeInsets.only(left: 16.0),
                          child: Card(
                            color: Colors.pink[900],
                            child: Icon(
                              Icons.polymer,
                              size: 60.0,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text("Research Grants",
                              overflow: TextOverflow.ellipsis,
                              softWrap: false,
                              maxLines: 2,
                              style: new TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)))
                    ]),
                  ),
                ),
              ),
              // GestureDetector(
              //   onTap: () {
              //     Navigator.push(context,
              //         MaterialPageRoute(builder: (context) => Scholarships()));
              //   },
              //   child: Card(
              //     color: Colors.white,
              //     elevation: 2.0,
              //     child: SizedBox(
              //       width: double.infinity,
              //       height: 100.0,
              //       child: Row(children: [
              //         SizedBox(
              //           height: 80,
              //           width: 100,
              //           child: Padding(
              //             padding: EdgeInsets.only(left: 16.0),
              //             child: Card(
              //               color: Colors.blue[900],
              //               child: Icon(
              //                 Icons.polymer,
              //                 size: 60.0,
              //               ),
              //             ),
              //           ),
              //         ),
              //         Padding(
              //             padding: EdgeInsets.all(16.0),
              //             child: Text("Scholarships",
              //                 overflow: TextOverflow.ellipsis,
              //                 softWrap: false,
              //                 maxLines: 2,
              //                 style: new TextStyle(
              //                     fontSize: 15,
              //                     fontWeight: FontWeight.bold,
              //                     color: Colors.black)))
              //       ]),
              //     ),
              //   ),
              // ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Support()));
                },
                child: Card(
                  color: Colors.white,
                  elevation: 2.0,
                  child: SizedBox(
                    width: double.infinity,
                    height: 100.0,
                    child: Row(children: [
                      SizedBox(
                        height: 80,
                        width: 100,
                        child: Padding(
                          padding: EdgeInsets.only(left: 16.0),
                          child: Card(
                            color: Colors.red[900],
                            child: Icon(
                              Icons.polymer,
                              size: 60.0,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text("Support",
                              overflow: TextOverflow.ellipsis,
                              softWrap: false,
                              maxLines: 2,
                              style: new TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)))
                    ]),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ResearchNews()));
                },
                child: Card(
                  color: Colors.white,
                  elevation: 2.0,
                  child: SizedBox(
                    width: double.infinity,
                    height: 100.0,
                    child: Row(children: [
                      SizedBox(
                        height: 80,
                        width: 100,
                        child: Padding(
                          padding: EdgeInsets.only(left: 16.0),
                          child: Card(
                            color: Colors.yellow[900],
                            child: Icon(
                              Icons.polymer,
                              size: 60.0,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text("News",
                              overflow: TextOverflow.ellipsis,
                              softWrap: false,
                              maxLines: 2,
                              style: new TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)))
                    ]),
                  ),
                ),
              ),
              // GestureDetector(
              //   onTap: () {
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => InternationalStudents()));
              //   },
              //   child: Card(
              //     color: Colors.white,
              //     elevation: 2.0,
              //     child: SizedBox(
              //       width: double.infinity,
              //       height: 100.0,
              //       child: Row(children: [
              //         SizedBox(
              //           height: 80,
              //           width: 100,
              //           child: Padding(
              //             padding: EdgeInsets.only(left: 16.0),
              //             child: Card(
              //               color: Colors.green[700],
              //               child: Icon(
              //                 Icons.polymer,
              //                 size: 60.0,
              //               ),
              //             ),
              //           ),
              //         ),
              //         Padding(
              //             padding: EdgeInsets.all(16.0),
              //             child: Text("International Students",
              //                 overflow: TextOverflow.ellipsis,
              //                 softWrap: false,
              //                 maxLines: 2,
              //                 style: new TextStyle(
              //                     fontSize: 15,
              //                     fontWeight: FontWeight.bold,
              //                     color: Colors.black)))
              //       ]),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ],
    );
  }
}
