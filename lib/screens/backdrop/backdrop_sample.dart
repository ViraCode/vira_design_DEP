import 'dart:ui';

import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class BackDropSmaple extends StatefulWidget {
  static const String route = "/backdrop/backdrop_sample";
  static const String name = "Backdrop Sample";
  @override
  _BackDropSmapleState createState() => _BackDropSmapleState();
}

class _BackDropSmapleState extends State<BackDropSmaple> {
  @override
  Widget build(BuildContext context) {
    return BackdropScaffold(
        appBar: BackdropAppBar(
          title: Text("P R O D U C T S",
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Open Sans",
                fontWeight: FontWeight.w800,
              )),
          actions: <Widget>[
            // IconButton(icon: Icons.location_on, onPressed: null),
            BackdropToggleButton(
              icon: AnimatedIcons.list_view,
            )
          ],
        ),
        backLayer: Container(
          child: ListView(
            children: [
              ListTile(
                title: Text("Home",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "OpenSans",
                        fontWeight: FontWeight.bold)),
                leading: Icon(Icons.home, color: Colors.white),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text("Login",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "OpenSans",
                        fontWeight: FontWeight.bold)),
                leading: Icon(Icons.login, color: Colors.white),
                onTap: () {},
              ),
              ListTile(
                title: Text("Sign up",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "OpenSans",
                        fontWeight: FontWeight.bold)),
                leading: Icon(Icons.person_add, color: Colors.white),
                onTap: () {},
              ),
              ListTile(
                title: Text("Category",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "OpenSans",
                        fontWeight: FontWeight.bold)),
                leading: Icon(Icons.cached_outlined, color: Colors.white),
                onTap: () {},
              ),
              ListTile(
                title: Text("Loacation",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "OpenSans",
                        fontWeight: FontWeight.bold)),
                leading: Icon(Icons.location_pin, color: Colors.white),
                onTap: () {},
              ),
            ],
          ),
        ),
        frontLayer: Container(
            color: Colors.red[50],
            child: SingleChildScrollView(
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  MyCard(
                      title: "T Shirt",
                      price: "\$50",
                      categories: [
                        {
                          "text": "Clothes",
                          "iconData": MaterialCommunityIcons.tshirt_crew
                        },
                        {
                          "text": "Clothes",
                          "iconData": MaterialCommunityIcons.tshirt_crew
                        },
                        {
                          "text": "Clothes",
                          "iconData": MaterialCommunityIcons.tshirt_crew
                        }
                      ],
                      offPrice: "\$35",
                      imageURL:
                          "https://raw.githubusercontent.com/SajadAbdr/vira_design/master/online_assets/effect-of-coronavirus-on-food.jpg"),
                  MyCard(
                      title: "T Shirt",
                      price: "\$50",
                      categories: [
                        {
                          "text": "Clothes",
                          "iconData": MaterialCommunityIcons.tshirt_crew
                        },
                        {
                          "text": "Clothes",
                          "iconData": MaterialCommunityIcons.tshirt_crew
                        },
                        {
                          "text": "Clothes",
                          "iconData": MaterialCommunityIcons.tshirt_crew
                        }
                      ],
                      offPrice: "\$35",
                      imageURL:
                          "https://raw.githubusercontent.com/SajadAbdr/vira_design/master/online_assets/effect-of-coronavirus-on-food.jpg"),
                  MyCard(
                      title: "T Shirt",
                      price: "\$50",
                      categories: [
                        {
                          "text": "Clothes",
                          "iconData": MaterialCommunityIcons.tshirt_crew
                        },
                        {
                          "text": "Clothes",
                          "iconData": MaterialCommunityIcons.tshirt_crew
                        },
                        {
                          "text": "Clothes",
                          "iconData": MaterialCommunityIcons.tshirt_crew
                        }
                      ],
                      offPrice: "\$35",
                      imageURL:
                          "https://raw.githubusercontent.com/SajadAbdr/vira_design/master/online_assets/effect-of-coronavirus-on-food.jpg"),
                  MyCard(
                      title: "T Shirt",
                      price: "\$50",
                      categories: [
                        {
                          "text": "Clothes",
                          "iconData": MaterialCommunityIcons.tshirt_crew
                        },
                        {
                          "text": "Clothes",
                          "iconData": MaterialCommunityIcons.tshirt_crew
                        },
                        {
                          "text": "Clothes",
                          "iconData": MaterialCommunityIcons.tshirt_crew
                        }
                      ],
                      offPrice: "\$35",
                      imageURL:
                          "https://raw.githubusercontent.com/SajadAbdr/vira_design/master/online_assets/effect-of-coronavirus-on-food.jpg"),
                ],
              ),
            )));
  }
}

class MyCard extends StatelessWidget {
  final String title;
  final String price;
  final String offPrice;
  final List<Map<String, dynamic>>
      categories; // [{"text": "String", "iconData": IconData}]
  final String imageURL;
  MyCard(
      {this.title, this.price, this.imageURL, this.categories, this.offPrice});

  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width / 2,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black.withOpacity(0.1))),
        child: Container(
            child: GestureDetector(
          onTap: () {},
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 2.02,
                  height: 150,
                  child: Card(
                      child: Image.network(
                    imageURL,
                    // fit: BoxFit.fill,
                  )),
                ),
                Row(
                  children: [
                    Container(
                        margin: EdgeInsets.fromLTRB(15, 15, 15, 0),
                        child: Text(
                          "$title",
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width / 28,
                            fontFamily: 'Oswald',
                          ),
                        )),
                    Expanded(
                      child: Container(),
                    ),
                    offPrice.isNotEmpty
                        ? Text("\n$offPrice",
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              decorationStyle: TextDecorationStyle.wavy,
                              decorationThickness: 5,
                              decorationColor: Colors.black,
                              fontSize: MediaQuery.of(context).size.width / 27,
                            ))
                        : null,
                    Container(
                      margin: EdgeInsets.fromLTRB(15, 15, 15, 0),
                      child: CircleAvatar(
                        backgroundColor: Colors.red,
                        child: Text(
                          price,
                          style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width / 30,
                              fontFamily: 'Oswald',
                              color: Colors.white,
                              decoration: offPrice == null
                                  ? null
                                  : TextDecoration.lineThrough),
                        ),
                      ),
                    ),
                  ],
                ),
                Wrap(alignment: WrapAlignment.center, spacing: 4, children: [
                  for (int i = 0; i < categories.length; i++)
                    Chip(
                      backgroundColor: Colors.green,
                      label: Text(
                        categories[i]["text"],
                        style: TextStyle(color: Colors.white),
                      ),
                      avatar:
                          Icon(categories[i]["iconData"], color: Colors.white),
                    ),
                ]),
              ],
            ),
          ),
        )));
  }
}
