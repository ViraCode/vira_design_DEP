import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class Drawer3d extends StatefulWidget {
  static const String route = "/animation_ui/drawer_3d";
  static const String name = "3D Animated Drawer";
  @override
  _Drawer3dState createState() => _Drawer3dState();
}

class _Drawer3dState extends State<Drawer3d>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  bool _canBeDragged;
  double maxSlide;

  // double minDragStartEdge = 100;
  double maxDragStartEdge = 0;
  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(microseconds: 800));
    super.initState();
  }

  void _onDragStart(DragStartDetails details) {
    print("drag started");
    bool isDragOpenFromLeft = animationController.isDismissed &&
        details.globalPosition.dx <
            MediaQuery.of(context).size.width * 0.7; //minDragStartEdge
    bool isDragClosedFromRight = animationController.isCompleted &&
        details.globalPosition.dx > 0.0; //maxDragStartEdge
    _canBeDragged = isDragOpenFromLeft || isDragClosedFromRight;
  }

  void _onDragUpdate(DragUpdateDetails details) {
    if (_canBeDragged) {
      double delta = details.primaryDelta / maxSlide;
      animationController.value += delta;
    }
  }

  void _onDragEnd(DragEndDetails details) {
    if (animationController.isDismissed || animationController.isCompleted)
      return;
    if (details.velocity.pixelsPerSecond.dx.abs() >= 365) {
      double visualVelocity = details.velocity.pixelsPerSecond.dx /
          MediaQuery.of(context).size.width;
      animationController.fling(velocity: visualVelocity);
    }
    if (animationController.value < 0.5)
      close();
    else
      open();
  }

  void open() => animationController.forward();
  void close() => animationController.reverse();
  void toggle() => animationController.isDismissed
      ? animationController.forward()
      : animationController.reverse();

  @override
  Widget build(BuildContext context) {
    maxSlide = MediaQuery.of(context).size.width / 2;
    return GestureDetector(
      onHorizontalDragStart: _onDragStart,
      onHorizontalDragUpdate: _onDragUpdate,
      onHorizontalDragEnd: _onDragEnd,
      child: AnimatedBuilder(
          animation: animationController,
          builder: (_, widget) {
            return Stack(
              children: [
                Transform.translate(
                  offset: Offset(maxSlide * (animationController.value - 1), 0),
                  child: Transform(
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateY(math.pi / 2 * (1 - animationController.value)),
                    alignment: Alignment.centerRight,
                    child: Container(
                      color: Colors.yellow,
                      width: MediaQuery.of(context).size.width / 2,
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(maxSlide * animationController.value, 0),
                  child: Transform(
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateY(-math.pi / 2 * animationController.value),
                    alignment: Alignment.centerLeft,
                    child: Scaffold(
                        backgroundColor: Colors.blueAccent,
                        appBar: AppBar(title: Text("3D Animated Drawer")),
                        body: Center(
                          child: Text("Drag me"),
                        )),
                  ),
                )
              ],
            );
          }),
    );
  }
}
