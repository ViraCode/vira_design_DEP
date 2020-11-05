import 'package:faker/faker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SimpleChat extends StatefulWidget {
  static const route = "/chat/simple_chat";
  static const name = "Simple Chat Screen";
  @override
  _SimpleChatState createState() => _SimpleChatState();
}

class _SimpleChatState extends State<SimpleChat> {
  GlobalKey _key = new GlobalKey();
  var _mainScrollController =
      new ScrollController(initialScrollOffset: 0, keepScrollOffset: true);
  var _messageController = new TextEditingController();
  List<Widget> _myMessages = [
    MyMessage(
      message: faker.lorem.sentence(),
    ),
    MyMessage(
      message: faker.lorem.sentence(),
    )
  ];
  List<Widget> _guyMessages = [
    GuyMessage(
      message: "heeyy",
    )
  ];
  _scrollControllerLastMessage() {
    RenderBox box = _key.currentContext.findRenderObject();
    Offset position = box.localToGlobal(Offset.zero); //this is global position
    double y = position.dy; //this is y - I think it's what you want
    print(y.toString());
    setState(() {
      // _mainScrollController.offset == y
      //     ? null
      //     : _mainScrollController.animateTo(y,
      //         duration: Duration(milliseconds: 580), curve: Curves.easeIn);
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Stack(
          children: [
            Container(
                color: Colors.red,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                    reverse: true,
                    controller: _mainScrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      key: _key,
                      children: [
                        Builder(
                          builder: (_) => Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: _myMessages,
                          ),
                        ),
                        SizedBox(
                          height: 83,
                        )
                      ],
                    ))),
            Positioned(
              bottom: 0,
              child: Container(
                // color: Colors.purple[100],
                // height: 100,asdasda
                padding: EdgeInsets.all(8),
                width: MediaQuery.of(context).size.width,
                child:
                    Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: CupertinoTextField(
                      controller: _messageController,
                      minLines: 1,
                      maxLines: 10,
                      padding: EdgeInsets.all(15),
                      style: TextStyle(),
                      textAlignVertical: TextAlignVertical.top,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  FloatingActionButton(
                    backgroundColor: Colors.blue[50],
                    onPressed: () {},
                    child:
                        Icon(Icons.dashboard_customize, color: Colors.purple),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  FloatingActionButton(
                    heroTag: "send",
                    backgroundColor: Colors.purple[800],
                    onPressed: () {
                      setState(() {
                        _myMessages
                            .add(MyMessage(message: _messageController.text));
                        _scrollControllerLastMessage();
                        _messageController.text = "";
                      });
                    },
                    child: Icon(Icons.send, color: Colors.white),
                  )
                ]),
              ),
            )
          ],
        ));
  }
}

class MyMessage extends StatelessWidget {
  final String message;
  final String time;
  const MyMessage({Key key, @required this.message, this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print(message);
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      alignment: Alignment.topLeft,
      margin: EdgeInsets.fromLTRB(15, 10, 15, 10),
      decoration: BoxDecoration(
          color: Colors.blue[100],
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10))),
      child: ListTile(
        title: Text(message),
      ),
    );
  }
}

class GuyMessage extends StatelessWidget {
  final String message;
  final String time;
  const GuyMessage({Key key, @required this.message, this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topRight,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5),
              topRight: Radius.circular(5),
              bottomRight: Radius.circular(5))),
      child: Text(message),
    );
  }
}
