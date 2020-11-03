import 'package:flutter/material.dart';

class CustomBackDrop extends StatefulWidget {
  static const String route = "/backdrop/custom_backdrop";
  static const String name = "Custom Backdrop";
  @override
  _CustomBackDropState createState() => _CustomBackDropState();
}

class _CustomBackDropState extends State<CustomBackDrop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: CustomScrollView(slivers: [
      SliverAppBar(
        automaticallyImplyLeading: false,
        // expandedHeight: 100.0,
        title: Text("Custom Back Drop"),
        backgroundColor: Colors.blue,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        flexibleSpace: FlexibleSpaceBar(
          background: Container(
            color: Colors.blue,
          ),
        ),
      ),
    ])));
  }
}
