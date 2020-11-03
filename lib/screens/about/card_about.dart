import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

class CardAbout extends StatefulWidget {
  static const String route = "/about/card_about";
  static const String name = "Card Stylized About";

  @override
  _CardAboutState createState() => _CardAboutState();
}

class _CardAboutState extends State<CardAbout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue[100],
        child: CustomScrollView(slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            expandedHeight: 100.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                  padding: EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width,
                  child: Text("VIRA CODE",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height *
                              MediaQuery.of(context).size.width /
                              9000,
                          fontFamily: '.SF UI Text',
                          inherit: true,
                          color: Colors.red,
                          fontWeight: FontWeight.w900))),
            ),
            backgroundColor: Colors.transparent,
            leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.blue,
                ),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.fromLTRB(40, 20, 40, 20),
                  // color: Colors.brown,
                  child: Card(
                    child: Container(
                        padding: EdgeInsets.all(20),
                        width: MediaQuery.of(context).size.width,
                        child: Text("VIRA CODE",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: MediaQuery.of(context).size.height *
                                    MediaQuery.of(context).size.width /
                                    9000,
                                fontFamily: '.SF UI Text',
                                inherit: true,
                                color: Colors.blue,
                                fontWeight: FontWeight.w900))),
                  ),
                ),
                Container(
                    // padding: EdgeInsets.all(20),
                    margin: EdgeInsets.fromLTRB(40, 10, 40, 10),
                    child: Card(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "About Us",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Container(
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(20)),
                            width: 50,
                            height: 5,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 30,
                                ),
                                Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 30,
                                      child: Icon(Icons.person),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      faker.person.name(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text("UI/UX Designer")
                                  ],
                                ),
                                Expanded(child: Container()),
                                Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 30,
                                      child: Icon(Icons.person),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      faker.person.name(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text("Android dev")
                                  ],
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                              ]),
                          SizedBox(
                            height: 20,
                          )
                        ],
                      ),
                    )),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.fromLTRB(40, 10, 40, 10),
                  child: Card(
                      child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "What We Do?",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(20)),
                          width: 50,
                          height: 5,
                        ),
                        Container(
                            child: Text(
                          "We develope softwares and we are cp .${faker.lorem.sentence()}",
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 16,
                              color: Colors.black),
                        ))
                      ],
                    ),
                  )),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
