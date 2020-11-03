import 'package:flutter/material.dart';
import 'package:vira_design/screens/about/card_about.dart';
import 'package:vira_design/screens/backdrop/backdrop_sample.dart';
import 'package:vira_design/screens/backdrop/custom_backdrop.dart';
import 'package:vira_design/screens/bottom_navigation_bars/convex_bottom_navigation_bar.dart';
import 'package:vira_design/screens/buttons/buttons.dart';
import 'package:vira_design/screens/dialog_box/custom_dialog_box.dart';
import 'package:vira_design/screens/product_page/sliver_product.dart';
import 'package:vira_design/screens/settings/sectioned_settings_with_profile.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: ListView(
          children: [
            ListTile(
                title: Text(SliverProductPage.name),
                onTap: () =>
                    Navigator.pushNamed(context, SliverProductPage.route)),
            ListTile(
                title: Text(ConvexBottomNavigationBar.name),
                onTap: () => Navigator.pushNamed(
                    context, ConvexBottomNavigationBar.route)),
            ListTile(
                title: Text(CardAbout.name),
                onTap: () => Navigator.pushNamed(context, CardAbout.route)),
            ListTile(
                title: Text(SectionedSettinsWithProfile.name),
                onTap: () => Navigator.pushNamed(
                    context, SectionedSettinsWithProfile.route)),
            ListTile(
                title: Text(ButtonPage.name),
                onTap: () => Navigator.pushNamed(context, ButtonPage.route)),
            ListTile(
                title: Text(BackDropSmaple.name),
                onTap: () =>
                    Navigator.pushNamed(context, BackDropSmaple.route)),
            ListTile(
                title: Text(CustomBackDrop.name),
                onTap: () =>
                    Navigator.pushNamed(context, CustomBackDrop.route)),
            ListTile(
                title: Text(CustomDialogBox.name),
                onTap: () =>
                    Navigator.pushNamed(context, CustomDialogBox.route)),
          ],
        ),
      ),
    );
  }
}
