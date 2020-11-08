import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
// import 'dart:math' as math;

import 'package:flutter_icons/flutter_icons.dart';

class TeamTaskManagement extends StatefulWidget {
  static const String name = "Team Task Management";
  static const String route = "/custom/team_task_management";
  @override
  _TeamTaskManagementState createState() => _TeamTaskManagementState();
}

class Time {
  final String string;
  bool isActive;
  Time({this.string, this.isActive});
}

class _TeamTaskManagementState extends State<TeamTaskManagement> {
  final List<Time> times = [
    Time(string: "07:00 - 09:00", isActive: false),
    Time(string: "09:00 - 11:00", isActive: true),
    Time(string: "11:00 - 13:00", isActive: false),
    Time(string: "13:00 - 15:00", isActive: false),
    Time(string: "15:00 - 17:00", isActive: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height * 0.75,
            backgroundColor: Color.fromRGBO(15, 17, 52, 1),
            toolbarHeight: 80,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.08,
                    left: MediaQuery.of(context).size.width * 0.1,
                    child: IconButton(
                        color: Colors.white,
                        highlightColor: Colors.white,
                        icon: Icon(Icons.more_vert,
                            color: Colors.white, size: 40),
                        onPressed: () => Navigator.pop(context)),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.03,
                    right: MediaQuery.of(context).size.width * 0.1,
                    child: ClipOval(
                        child: Image.asset(
                      "assets/avatars/1_002.jpg",
                      fit: BoxFit.fitHeight,
                    )),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.2,
                    left: MediaQuery.of(context).size.width * 0.1,
                    child: Text(
                      "Today Task",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width / 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1.2,
                          fontFamily: "McLaren"),
                    ),
                  ),
                  TimeTabBar(
                    times: times,
                  ),
                  TaskCard(
                    tasks: [
                      Task(
                        time: "09:50",
                        title: "MEETING",
                        subTitle: "Flexi Weekly Meeting",
                        avatars: [
                          "assets/avatars/1_002.jpg",
                          "assets/avatars/1_003.jpg",
                          "assets/avatars/1.jpg",
                          "assets/avatars/4_002.jpg",
                          "assets/avatars/4_003.jpg"
                        ],
                      ),
                      Task(
                        time: "10:30",
                        title: "RESEARCH",
                        subTitle: "Research About UI",
                        avatars: [
                          "assets/avatars/10_002.jpg",
                          "assets/avatars/10.jpg",
                          "assets/avatars/11_002.jpg",
                          "assets/avatars/11.jpg",
                        ],
                      ),
                      Task(
                        time: "09:50",
                        title: "MEETING",
                        subTitle: "Flexi Weekly Meeting",
                        avatars: [
                          "assets/avatars/12_002.jpg",
                          "assets/avatars/14.jpg",
                          "assets/avatars/12.jpg",
                          "assets/avatars/13_002.jpg"
                        ],
                      )
                    ],
                  )
                ],
              ),
            ))
      ],
    ));
  }
}

class Task {
  final String time;
  final String title;
  final String subTitle;
  final List<String> avatars;

  Task({
    @required this.time,
    @required this.subTitle,
    @required this.title,
    @required this.avatars,
  });
}

class TaskCard extends StatefulWidget {
  final List<Task> tasks;
  TaskCard({@required this.tasks});
  @override
  _TaskCardState createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  List<bool> expndedAvatar;

  @override
  void initState() {
    // for (int i = 0; i < widget.tasks.length; i++) {
    // print("key[$i][$j]");
    // widget.tasks[i].keys = List.generate(widget.tasks[i].avatars.length,
    //     (index) => GlobalKey<_AvatarFaderState>());
    //  = new GlobalKey<_AvatarFaderState>();
    // keys[i][j] = new GlobalKey<_AvatarFaderState>();

    //   // expndedAvatar = new List<bool>(widget.tasks.length);
    // }

    super.initState();
  }

  void onTap(List<GlobalKey<_AvatarFaderState>> keysx) async {
    print("im ontappppppppppp");
    for (GlobalKey<_AvatarFaderState> key in keysx) {
      await Future.delayed(Duration(milliseconds: 100));
      key.currentState.show();
    }
  }

  // void onHide(List<GlobalKey> keys) async {
  //   for (GlobalKey<_AvatarFaderState> key in keys) {
  //     await Future.delayed(Duration(milliseconds: 100));
  //     key.currentState.hide();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final tasks = widget.tasks;
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      top: MediaQuery.of(context).size.height * 0.38,
      child: ListView(scrollDirection: Axis.horizontal, children: [
        SizedBox(
          width: 20,
        ),
        ...tasks.map((task) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            // height: MediaQuery.of(context).size.height * 0.01,
            width: MediaQuery.of(context).size.width * 0.6,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.blue.withOpacity(0.3),
                      spreadRadius: 15,
                      blurRadius: 20)
                ],
                gradient: LinearGradient(
                    colors: [Colors.blue[200], Colors.blue[400]],
                    end: Alignment.bottomCenter,
                    begin: Alignment.topCenter),
                // color: Color.fromRGBO(0, 173, 255, 1),
                borderRadius: BorderRadius.circular(80)),
            child: Stack(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Positioned(
                  top: 30,
                  left: 40,
                  child: Row(
                    children: [
                      Icon(
                        MaterialCommunityIcons.clock_outline,
                        color: Colors.blue[800],
                        size: 60,
                      ),
                      Text(
                        " ${task.time}",
                        style: TextStyle(
                            color: Colors.blue[800],
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontFamily: "OpenSans",
                            letterSpacing: 1.5),
                      ),
                    ],
                  ),
                ),
                Positioned(
                    top: MediaQuery.of(context).size.height * 0.11,
                    left: MediaQuery.of(context).size.width * 0.1,
                    child: Text(
                      task.title,
                      style: TextStyle(
                          color: Colors.blue[800],
                          fontWeight: FontWeight.w400,
                          fontSize: 22,
                          fontFamily: "Anton",
                          letterSpacing: 2.5),
                    )),
                Positioned(
                    top: MediaQuery.of(context).size.height * 0.16,
                    left: MediaQuery.of(context).size.width * 0.1,
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Text(
                      task.subTitle,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                          fontFamily: "Oswald",
                          letterSpacing: 2),
                    )),
                Positioned(child: AvatarFader(avatars: task.avatars))
              ],
            ),
          );
        })
      ]),
    );
  }
}

class AvatarFader extends StatefulWidget {
  final List<String> avatars;
  AvatarFader({
    Key key,
    @required this.avatars,
  }) : super(key: key);

  @override
  _AvatarFaderState createState() => _AvatarFaderState();
}

class _AvatarFaderState extends State<AvatarFader>
    with TickerProviderStateMixin {
  List<String> avatars;
  // List<GlobalKey> keys;
  int position = 1;
  List<AnimationController> _animationController;
  List<Animation> _animation;
  AnimationController inkWellAnimController;
  Animation inkWellAnim;

  @override
  void initState() {
    // keys = List.generate(avatars.length, (index) => CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));
    avatars = widget.avatars;
    _animationController = new List<AnimationController>(avatars.length);
    _animation = new List<Animation>(avatars.length);
    for (int i = 0; i < avatars.length; i++) {
      _animationController[i] = AnimationController(
          vsync: this, duration: Duration(milliseconds: 600));

      _animation[i] = CurvedAnimation(
          parent: _animationController[i], curve: Curves.easeInOut);
    }

    inkWellAnimController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));

    inkWellAnim =
        CurvedAnimation(parent: inkWellAnimController, curve: Curves.easeInOut);

    super.initState();
  }

  // void() inkWellRotation() async {

  // }

  void show() async {
    if (_animationController[0].isDismissed)
      for (AnimationController anim in _animationController) {
        await Future.delayed(Duration(milliseconds: 83));
        setState(() {
          anim.forward();
        });
        print(anim.value);
      }
    else if (_animationController[0].isCompleted)
      for (AnimationController anim in _animationController) {
        await Future.delayed(Duration(milliseconds: 83));
        setState(() {
          anim.reverse();
        });
        print(anim.value);
      }
  }

  // void onTap() async {
  //   for (GlobalKey key in keys) {
  //     await Future.delayed(Duration(milliseconds: 40));
  //     show();
  //   }
  // }

  // void hide() {
  //   setState(() {
  //     _animationController.reverse();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // bool butt = true;
    return Stack(
      children: [
        //  Positioned(
        // top: MediaQuery.of(context).size.height * 0.25,
        // left: MediaQuery.of(context).size.width * 0.05 +
        //     avatars.indexOf(avatar) *
        //         MediaQuery.of(context).size.width *
        //         0.07,
        //       child: ...avat?ars.map((e) => null)
        //  ),
        ...avatars.map((avatar) {
          return Stack(
            children: [
              Positioned(
                top: MediaQuery.of(context).size.height * 0.25,
                left: MediaQuery.of(context).size.width * 0.15 +
                    avatars.indexOf(avatar) *
                        MediaQuery.of(context).size.width *
                        0.07,
                child: AnimatedBuilder(
                  animation: _animation[avatars.indexOf(avatar)],
                  builder: (_, child) {
                    print("${_animation[0].value} is meeeeee");
                    return Transform.translate(
                      offset: Offset(
                          -_animation[avatars.indexOf(avatar)].value * 10, 0),
                      child:
                          // Container(
                          //     width: 100, height: 100, color: Colors.red)

                          Opacity(
                        opacity: _animation[avatars.indexOf(avatar)].value,
                        child: child,
                      ),
                    );
                  },
                  child: Opacity(
                    opacity: 0.83, // to the Barney from himym
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.blue, width: 2)),
                      child: ClipOval(
                        child: Image.asset(
                          avatar,
                          width: MediaQuery.of(context).size.width * 0.1,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          );
        }),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.265,
          left: MediaQuery.of(context).size.width * 0.05,
          child: AnimatedBuilder(
            animation: inkWellAnim,
            builder: (_, child) {
              return Transform.rotate(
                angle: 3.14 / 2 * inkWellAnim.value,
                child: child,
              );
            },
            child: InkWell(
              child: Icon(
                Icons.more_horiz,
                color: Colors.blue[800],
              ),
              onTap: () {
                print("Icon tapped");

                setState(() {
                  if (inkWellAnimController.isCompleted)
                    inkWellAnimController.reverse();
                  if (inkWellAnimController.isDismissed)
                    inkWellAnimController.forward();
                  show();
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}

class TimeTabBar extends StatefulWidget {
  final List<Time> times;
  final VoidCallback onTap;
  TimeTabBar({this.times, this.onTap});
  @override
  _TimeTabBarState createState() => _TimeTabBarState();
}

class _TimeTabBarState extends State<TimeTabBar> {
  List<GlobalKey> keys; // AnimationController _animationController;
  ScrollController _scrollController;
  var _activeTimeStyle = new TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w700,
      fontFamily: "Lato",
      fontSize: 18,
      shadows: [Shadow(color: Colors.white, blurRadius: 4)],
      letterSpacing: 1.2);
  var _inactiveTimeStyle = new TextStyle(
      color: Colors.white.withOpacity(0.5),
      fontWeight: FontWeight.w400,
      fontFamily: "Lato",
      fontSize: 18,
      letterSpacing: 1.2);
  @override
  void initState() {
    keys = List.generate(widget.times.length, (index) => GlobalKey());
    super.initState();
  }

  void onInit() {
    setState(() {
      RenderBox object = keys[1].currentContext.findRenderObject();
      Offset globalPosition = object.localToGlobal(Offset(0, 0));
      double mid = MediaQuery.of(context).size.width / 2;
      double pos =
          _scrollController.offset.toDouble() + globalPosition.dx - mid;
      // pos = pos.abs();s
      setState(() {
        for (var time in widget.times) time.isActive = false;
        widget.times[1].isActive = true;

        _scrollController.animateTo(pos + 60,
            duration: Duration(milliseconds: 350), curve: Curves.easeIn);
      });
    });
  }

  void setPosition() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    _scrollController = new ScrollController(
        initialScrollOffset: MediaQuery.of(context).size.width / 2);

    return Positioned(
        top: MediaQuery.of(context).size.height * 0.3,
        left: 0,
        bottom: 0.0,
        right: 0.0,
        child: SizedBox(
            width: MediaQuery.of(context).size.width * 2,
            height: MediaQuery.of(context).size.height * 0.02,
            child: ListView(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2.5,
                  ),
                  ...widget.times.map((e) {
                    int index = widget.times.indexOf(e);
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: GestureDetector(
                        onTap: () {
                          RenderBox object =
                              keys[index].currentContext.findRenderObject();
                          Offset globalPosition =
                              object.localToGlobal(Offset(0, 0));
                          double mid = MediaQuery.of(context).size.width / 2;
                          double pos = _scrollController.offset.toDouble() +
                              globalPosition.dx -
                              mid;
                          // pos = pos.abs();s
                          setState(() {
                            for (var time in widget.times)
                              time.isActive = false;
                            widget.times[index].isActive = true;

                            _scrollController.animateTo(pos + 60,
                                duration: Duration(milliseconds: 350),
                                curve: Curves.easeIn);
                          });
                        },
                        child: Column(
                          key: keys[index],
                          children: [
                            Text(widget.times[index].string,
                                style: widget.times[index].isActive
                                    ? _activeTimeStyle
                                    : _inactiveTimeStyle),
                            Container(
                              margin: EdgeInsets.only(top: 14),
                              width: 5,
                              height: 5,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: widget.times[index].isActive
                                      ? Colors.white
                                      : Colors.transparent,
                                  boxShadow: widget.times[index].isActive
                                      ? [
                                          BoxShadow(
                                              color: Colors.white,
                                              blurRadius: 4)
                                        ]
                                      : []),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
                  // Builder(builder: (context) {
                  // setState(() {
                  //   RenderBox object =
                  //       keys[1].currentContext.findRenderObject();
                  //   Offset globalPosition =
                  //       object.localToGlobal(Offset(0, 0));
                  //   double mid = MediaQuery.of(context).size.width / 2;
                  //   double pos = _scrollController.offset.toDouble() +
                  //       globalPosition.dx -
                  //       mid;
                  //   setState(() {
                  //     _scrollController.animateTo(pos + 60,
                  //         duration: Duration(milliseconds: 350),
                  //         curve: Curves.easeIn);
                  //   });
                  // });
                  // return
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2.5,
                  )
                ])));
  }
}
