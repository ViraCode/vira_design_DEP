import 'package:flutter/material.dart';
import 'package:vira_design/screens/animation_ui/flight_survey.dart';
import 'package:vira_design/screens/chat/simple_chat.dart';
import 'package:vira_design/screens/about/card_about.dart';
import 'package:vira_design/screens/animation_ui/drawer_2d.dart';
import 'package:vira_design/screens/backdrop/backdrop_sample.dart';
import 'package:vira_design/screens/backdrop/custom_backdrop.dart';
import 'package:vira_design/screens/bottom_navigation_bars/convex_bottom_navigation_bar.dart';
import 'package:vira_design/screens/buttons/buttons.dart';
import 'package:vira_design/screens/dialog_box/custom_dialog_box.dart';
import 'package:vira_design/screens/product_page/sliver_product.dart';
import 'package:vira_design/screens/product_page/sliver_stacked_product.dart';
import 'package:vira_design/screens/settings/sectioned_settings_with_profile.dart';
import 'dart:core';
import 'package:flutter/cupertino.dart';

import 'animation_ui/drawer_3d.dart';
import 'customs/team_task_management.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var textcon = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("VIRA Design",
            style: TextStyle(
              color: Colors.white,
              fontFamily: "Open Sans",
              fontWeight: FontWeight.w800,
            )),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.black, Colors.black26])),
        child: ListView(
          children: [
            ListTile(
                title: Text(SliverProductPage.name,
                    style: TextStyle(color: Colors.white, fontFamily: "Lato")),
                onTap: () =>
                    Navigator.pushNamed(context, SliverProductPage.route)),
            ListTile(
                title: Text(ConvexBottomNavigationBar.name,
                    style: TextStyle(color: Colors.white, fontFamily: "Lato")),
                onTap: () => Navigator.pushNamed(
                    context, ConvexBottomNavigationBar.route)),
            ListTile(
                title: Text(CardAbout.name,
                    style: TextStyle(color: Colors.white, fontFamily: "Lato")),
                onTap: () => Navigator.pushNamed(context, CardAbout.route)),
            ListTile(
                title: Text(SectionedSettinsWithProfile.name,
                    style: TextStyle(color: Colors.white, fontFamily: "Lato")),
                onTap: () => Navigator.pushNamed(
                    context, SectionedSettinsWithProfile.route)),
            ListTile(
                title: Text(ButtonPage.name,
                    style: TextStyle(color: Colors.white, fontFamily: "Lato")),
                onTap: () => Navigator.pushNamed(context, ButtonPage.route)),
            ListTile(
                title: Text(BackDropSmaple.name,
                    style: TextStyle(color: Colors.white, fontFamily: "Lato")),
                onTap: () =>
                    Navigator.pushNamed(context, BackDropSmaple.route)),
            ListTile(
                title: Text(CustomBackDrop.name,
                    style: TextStyle(color: Colors.white, fontFamily: "Lato")),
                onTap: () =>
                    Navigator.pushNamed(context, CustomBackDrop.route)),
            ListTile(
                title: Text(CustomDialogBox.name,
                    style: TextStyle(color: Colors.white, fontFamily: "Lato")),
                onTap: () =>
                    Navigator.pushNamed(context, CustomDialogBox.route)),
            ListTile(
                title: Text(SliverStackedProduct.name,
                    style: TextStyle(color: Colors.white, fontFamily: "Lato")),
                onTap: () =>
                    Navigator.pushNamed(context, SliverStackedProduct.route)),
            ListTile(
                title: Text(SimpleChat.name,
                    style: TextStyle(color: Colors.white, fontFamily: "Lato")),
                onTap: () => Navigator.pushNamed(context, SimpleChat.route)),
            ListTile(
                title: Text(Drawer2d.name,
                    style: TextStyle(color: Colors.white, fontFamily: "Lato")),
                onTap: () => Navigator.pushNamed(context, Drawer2d.route)),
            ListTile(
                title: Text(Drawer3d.name,
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Lato",
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1)),
                onTap: () => Navigator.pushNamed(context, Drawer3d.route)),
            ListTile(
                title: Text(FlightSurvey.name,
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Lato",
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1)),
                onTap: () => Navigator.pushNamed(context, FlightSurvey.route)),
            ListTile(
                title: Text(TeamTaskManagement.name,
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Lato",
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1)),
                onTap: () =>
                    Navigator.pushNamed(context, TeamTaskManagement.route)),

            // Directionality(
            //   textDirection: TextDirection.rtl,
            //   child: TextField(
            //     textDirection: TextDirection.rtl,
            //     controller: textcon,
            //     onChanged: (String string) {
            //       print(textcon.text);
            //     },
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
