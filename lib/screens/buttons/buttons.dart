import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonPage extends StatefulWidget {
  ButtonPage({Key key}) : super(key: key);
  static const String route = "/buttons/buttons";
  static const String name = "Buttons";
  @override
  _ButtonPageState createState() => _ButtonPageState();
}

enum WhyFarther { harder, smarter, selfStarter, tradingCharter }

class _ButtonPageState extends State<ButtonPage> {
  double sideLength = 50;
  var isSelected = [false, true, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: CustomScrollView(slivers: [
      SliverAppBar(
        automaticallyImplyLeading: false,
        // expandedHeight: 100.0,
        title: Text("Buttons"),
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
          child: Container(
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                BorderedContainerWithText(
                  text: "Cupertino Buttons",
                  child: Wrap(spacing: 10, children: [
                    CupertinoButton(
                      child: Text('Button'),
                      onPressed: () {/** */},
                    ),
                    CupertinoButton.filled(
                      child: Text('Button'),
                      onPressed: () {/** */},
                    ),
                  ]),
                ),
                BorderedContainerWithText(
                  text: "Flat Button",
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)),
                    color: Colors.blue[50],
                    onPressed: () {},
                    child: Text(
                      "Apply",
                      // style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                BorderedContainerWithText(
                  child: FloatingActionButton(
                    onPressed: () {
                      // Add your onPressed code here!
                    },
                    child: Icon(Icons.thumb_up),
                    backgroundColor: Colors.pink,
                  ),
                  text: "Floating Action Button",
                ),
                BorderedContainerWithText(
                  text: "Customized Ink Well",
                  child: Container(
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.red)),
                    height: 50,
                    width: 150,
                    child: InkWell(
                      child: Center(
                        child: Text(
                          "",
                          textAlign: TextAlign.center,
                        ),
                      ),
                      splashColor: Colors.red,
                      onTap: () {
                        setState(() {
                          sideLength == 50 ? sideLength = 100 : sideLength = 50;
                        });
                      },
                    ),
                  ),
                ),
                BorderedContainerWithText(
                  text: "Icon Button",
                  child: IconButton(
                    icon: Icon(Icons.volume_up),
                    tooltip: 'Increase volume by 10',
                    onPressed: () {
                      setState(() {});
                    },
                  ),
                ),
                BorderedContainerWithText(
                  text: "Outline Button",
                  child: OutlineButton(
                    onPressed: () {
                      /*...*/
                    },
                    child: Text(
                      "Continue",
                    ),
                  ),
                ),
                BorderedContainerWithText(
                  text: "Raised Buttons",
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const RaisedButton(
                        onPressed: null,
                        child: Text('Disabled Button',
                            style: TextStyle(fontSize: 20)),
                      ),
                      const SizedBox(height: 30),
                      RaisedButton(
                        onPressed: () {},
                        child: const Text('Enabled Button',
                            style: TextStyle(fontSize: 20)),
                      ),
                      const SizedBox(height: 30),
                      RaisedButton(
                        onPressed: () {},
                        textColor: Colors.white,
                        padding: const EdgeInsets.all(0.0),
                        child: Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: <Color>[
                                Color(0xFF0D47A1),
                                Color(0xFF1976D2),
                                Color(0xFF42A5F5),
                              ],
                            ),
                          ),
                          padding: const EdgeInsets.all(10.0),
                          child: const Text('Gradient Button',
                              style: TextStyle(fontSize: 20)),
                        ),
                      ),
                    ],
                  ),
                ),
                BorderedContainerWithText(
                  text: "Button Bar(Flat Buttons)",
                  child: ButtonBar(
                    alignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FlatButton(
                        child: Text('Ok'),
                        color: Colors.blue,
                        onPressed: () {/** */},
                      ),
                      FlatButton(
                        child: Text('Cancel'),
                        color: Colors.blue,
                        onPressed: () {/** */},
                      ),
                    ],
                  ),
                ),
                BorderedContainerWithText(
                  text: "Pop-up Buttons",
                  child: PopupMenuButton<WhyFarther>(
                    onSelected: (WhyFarther result) {
                      setState(() {});
                    },
                    itemBuilder: (BuildContext context) =>
                        <PopupMenuEntry<WhyFarther>>[
                      const PopupMenuItem<WhyFarther>(
                        value: WhyFarther.harder,
                        child: Text('Working a lot harder'),
                      ),
                      const PopupMenuItem<WhyFarther>(
                        value: WhyFarther.smarter,
                        child: Text('Being a lot smarter'),
                      ),
                      const PopupMenuItem<WhyFarther>(
                        value: WhyFarther.selfStarter,
                        child: Text('Being a self-starter'),
                      ),
                      const PopupMenuItem<WhyFarther>(
                        value: WhyFarther.tradingCharter,
                        child: Text('Placed in charge of trading charter'),
                      ),
                    ],
                  ),
                ),
                BorderedContainerWithText(
                  text: "Toggle Buttons",
                  child: ToggleButtons(
                    children: <Widget>[
                      Icon(Icons.ac_unit),
                      Icon(Icons.emoji_food_beverage_outlined),
                      Icon(Icons.cake),
                    ],
                    onPressed: (int index) {
                      setState(() {
                        isSelected[index] = !isSelected[index];
                      });
                    },
                    isSelected: isSelected,
                  ),
                )
              ],
            )
          ],
        ),
      ))
    ])));
  }
}

class BorderedContainerWithText extends StatelessWidget {
  final String text;
  final Widget child;
  BorderedContainerWithText({this.text, this.child});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border.all(
                  color: Color.fromARGB(255, 51, 204, 255), width: 1),
              borderRadius: BorderRadius.circular(5),
              shape: BoxShape.rectangle,
            ),
            alignment: Alignment.center,
            child: child),
        Positioned(
            left: 50,
            top: 12,
            child: Container(
              padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
              color: Colors.white,
              child: Text(
                text,
                style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 12,
                    fontFamily: "OpenSans"),
              ),
            )),
      ],
    );
  }
}
