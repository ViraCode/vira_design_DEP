import 'dart:ui';

import 'package:flutter/material.dart';

class BlurImage extends StatefulWidget {
  static const String route = "/custom/blue_image";
  static const String name = "Animated Image Blur";
  @override
  _BlurImageState createState() => _BlurImageState();
}

class _BlurImageState extends State<BlurImage>
    with SingleTickerProviderStateMixin {
  Animation _anim;
  AnimationController _animController;

  @override
  void initState() {
    _animController =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
    _anim = CurvedAnimation(parent: _animController, curve: Curves.easeInOut);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Blur Image"),
      ),
      body: Stack(
        children: [
          // Image.asset("online_assets/587277-515x515-1.jpg"),
          // BackdropFilter(
          //   filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          // ),
          Container(
            width: 350,
            height: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('online_assets/587277-515x515-1.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
              child: Container(
                color: Colors.black.withOpacity(0),
              ),
            ),
          ),
          AnimatedBuilder(
            animation: _anim,
            builder: (_, child) {
              print("Anim started");
              return Container(
                // origin: Offset(
                //     _animController.value * 10, _animController.value * 10),
                child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5)),
              );
            },
          ),
          Positioned(
            top: 600,
            left: 100,
            width: 100,
            height: 1000,
            child: RaisedButton(
              color: Colors.red,
              onPressed: () {
                setState(() {
                  _animController.forward();
                });
              },
              child: Text("SADASADS"),
            ),
          ),
        ],
      ),
    );
  }
}
