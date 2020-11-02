import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

class ConvexBottomNavigationBar extends StatefulWidget {
  static const String route =
      "/bottom_navigation_bar/convex_bottom_navigation_bar";
  static const String name = "Convex Bottom Navigation Bar";
  @override
  _ConvexBottomNavigationBarState createState() =>
      _ConvexBottomNavigationBarState();
}

class _ConvexBottomNavigationBarState extends State<ConvexBottomNavigationBar> {
  final List tabString = [
    "Fixed Circle",
    "Single Button",
    "Flip",
    "React Circle",
    "Text In",
    "Titled",
    "React",
    "Fixed",
    "Badge",
    "Simple"
  ];
  final List<TabItem> _items = [
    TabItem(icon: Icons.home, title: 'Home'),
    TabItem(icon: Icons.map, title: 'Discovery'),
    TabItem(icon: Icons.add, title: 'Add'),
  ];
  int idx = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Convex App Bar')),
        body: ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            for (int i = 0; i < tabString.length; i++)
              Container(
                  // color: Colors.blue,
                  margin: EdgeInsets.fromLTRB(60, 5, 60, 5),
                  child: RaisedButton(
                    color: Colors.blue,
                    onPressed: () {
                      setState(() {
                        idx = i;
                      });
                    },
                    child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          tabString[i].toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 18),
                        )),
                  ))
          ],
        ),
        bottomNavigationBar: Builder(builder: (_) {
          switch (idx) {
            case 1:
              return _single();
            case 2:
              return _fixedCircle();
            case 3:
              return _flip();
            case 4:
              return _reactCircle();
            case 5:
              return _textIn();
            case 6:
              return _titled();
            case 7:
              return _react();
            case 8:
              return _fixed();
            case 9:
              return _badge();
            case 10:
              return _simple();
            default:
              return _simple();
          }
        }));
  }

  _single() => ConvexButton.fab();

  _fixedCircle() => ConvexAppBar(
        items: _items,
        style: TabStyle.fixedCircle,
      );
  _flip() => ConvexAppBar(
        items: _items,
        style: TabStyle.flip,
      );
  _reactCircle() => ConvexAppBar(
        items: _items,
        style: TabStyle.reactCircle,
      );
  _textIn() => ConvexAppBar(
        items: _items,
        style: TabStyle.textIn,
      );

  _titled() => ConvexAppBar(
        items: _items,
        style: TabStyle.titled,
      );

  _react() => ConvexAppBar(
        items: _items,
        style: TabStyle.react,
      );
  _fixed() => ConvexAppBar(
        style: TabStyle.fixed,
        items: _items,
      );
  _badge() => ConvexAppBar.badge(
        {0: '99+', 1: Icons.assistant_photo, 2: Colors.redAccent},
        items: _items,
      );

  _simple() => ConvexAppBar(
        items: _items,
      );
}
