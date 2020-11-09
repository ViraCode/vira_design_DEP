import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDialogBox extends StatefulWidget {
  static const String route = "/dialog_box/custom_dialog_box";
  static const String name = "Custom Animationd Dialog Box";
  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text("Custom Dialog Box", style: TextStyle(fontFamily: "McLaren")),
        backgroundColor: Colors.purple,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
          color: Colors.purple,
          alignment: Alignment.center,
          child: FloatingActionButton(
            backgroundColor: Colors.red,
            child: Icon(
              Icons.filter_alt,
            ),
            onPressed: () {
              showDialog(context: context, builder: (_) => AnimatedDialogBox());
            },
          )),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Friends"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "HOME"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.message,
              ),
              label: "Chat"),
        ],
      ),
    );
  }
}

class CategorySelector extends StatefulWidget {
  @override
  _CategorySelectorState createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  bool isEditingCategories = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Container(
          child: ListView(shrinkWrap: true, children: [
            Container(
              margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: CupertinoTextField(
                keyboardType: TextInputType.text,
                placeholder: 'Category',
                placeholderStyle: TextStyle(
                  color: Colors.purple,
                  fontSize: 14.0,
                  fontFamily: 'Brutal',
                ),
                prefix: Padding(
                  padding: const EdgeInsets.fromLTRB(9.0, 6.0, 9.0, 6.0),
                  child: Icon(Icons.add, color: Colors.purple),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18.0),
                  color: Color(0xffF0F1F5).withOpacity(0.75),
                ),
                onChanged: (_) {},
              ),
            ),
            Container(
                height: 120,
                width: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 120,
                      width: 200,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: (_, index) {
                          return Container(
                              width: 50,
                              child: Card(
                                child: new CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: new Text('$index'),
                                ),
                              ));
                        },
                        itemCount: 12,
                      ),
                    )
                  ],
                ))
          ]),
        )
      ],
    ));
  }
}

class AnimatedDialogBox extends StatefulWidget {
  @override
  _AnimatedDialogBoxState createState() => _AnimatedDialogBoxState();
}

class _AnimatedDialogBoxState extends State<AnimatedDialogBox>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.elasticInOut);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Container(
            padding: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width / 1.2,
            height: MediaQuery.of(context).size.height / 1.5,
            decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0))),
            child: Column(
              children: [
                CategorySelector(),
                Expanded(
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FlatButton.icon(
                          textColor: Color(0xFF6200EE),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(Icons.cancel, size: 18),
                          label: Text("Cancel"),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        FlatButton.icon(
                          textColor: Color(0xFF6200EE),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(Icons.search, size: 18),
                          label: Text("Apply"),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
