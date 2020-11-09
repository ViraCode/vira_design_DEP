import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
// import 'dart:math' as math;

import 'package:flutter_icons/flutter_icons.dart';
import 'package:url_launcher/url_launcher.dart';

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
  final List<RecentTask> recentTasks = [
    RecentTask(
        title: faker.conference.name(),
        icon: Icons.accessibility_sharp,
        isActive: true),
    RecentTask(
        title: faker.conference.name(),
        icon: Icons.accessibility_sharp,
        isActive: true),
    RecentTask(
        title: faker.conference.name(),
        icon: Icons.accessibility_sharp,
        isActive: true),
    RecentTask(
        title: faker.conference.name(),
        icon: Icons.accessibility_sharp,
        isActive: true),
    RecentTask(
        title: faker.conference.name(),
        icon: Icons.accessibility_sharp,
        isActive: true),
    RecentTask(
        title: faker.conference.name(),
        icon: Icons.accessibility_sharp,
        isActive: true),
  ];

  final GlobalKey<SliverAnimatedListState> listKey =
      new GlobalKey<SliverAnimatedListState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.transparent,
        body: Stack(
      alignment: Alignment.center,
      children: [
        CustomScrollView(
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
                        child: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.blue, width: 1)),
                          child: ClipOval(
                              child: Image.asset(
                            "assets/avatars/1_002.jpg",
                            fit: BoxFit.fitHeight,
                          )),
                        ),
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
                )),
            SliverToBoxAdapter(
              child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    // borderRadius: BorderRadius.only(
                    //     topLeft: Radius.circular(50),
                    //     topRight: Radius.circular(50))
                  ),
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "Recent Tasks",
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width / 25,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1,
                        fontFamily: "OpenSans"),
                  )),
            ),
            ...recentTasks.map((task) => RecentTaskBuilder(task: task))
          ],
        ),
        Positioned(
            bottom: 0,
            child: Container(
              height: 1,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    blurRadius: 200, spreadRadius: 90, color: Colors.white)
              ]),
            )),
        PlusButton(
          onTap: () {
            AwesomeDialog(
              context: context,
              animType: AnimType.SCALE,
              dialogType: DialogType.INFO,
              body: Center(
                child: InkWell(
                  onTap: () async {
                    final url =
                        'https://dribbble.com/shots/14381895-Team-Task-Management';
                    if (await canLaunch(url)) {
                      await launch(
                        url,
                        forceSafariVC: false,
                      );
                    }
                  },
                  child: Text(
                    'Design by AmirUix',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ),
              title: 'This is Ignored',
              desc: 'This is also Ignored',
              btnOkOnPress: () {},
            )..show();
          },
        ),
      ],
    ));
  }
}

class RecentTask {
  final String title;
  final bool isActive;
  final IconData icon;

  RecentTask({this.title, this.isActive, this.icon});
}

class RecentTaskBuilder extends StatefulWidget {
  final RecentTask task;
  const RecentTaskBuilder({Key key, this.task}) : super(key: key);
  @override
  _RecentTaskBuilderState createState() => _RecentTaskBuilderState();
}

class _RecentTaskBuilderState extends State<RecentTaskBuilder> {
  // List<GlobalKey> keys;
  GlobalKey iconKey = GlobalKey();
  RecentTask task;
  @override
  void initState() {
    // for (int i = 0; i < widget.tasks.length; i++) keys[i] = GlobalKey();
    task = widget.task;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: 150,
        // wid
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                height: 150,
                width: MediaQuery.of(context).size.width * 0.2,
                child: Stack(children: [
                  Positioned(
                    left: MediaQuery.of(context).size.width * 0.1 + 12,
                    child: Container(
                        width: 2,
                        height: 200,
                        decoration: BoxDecoration(color: Colors.blue[300])),
                  ),
                  Positioned(
                    left: MediaQuery.of(context).size.width * 0.1,
                    // top: MediaQuery.of(context).size.height * 0.04,
                    child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:
                              task.isActive ? Colors.blue[300] : Colors.white,
                          border: Border.all(color: Colors.blue, width: 1),
                        ),
                        child: Icon(Icons.bolt, color: Colors.white)),
                  ),
                ])),
            Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: Colors.blue.withOpacity(0.2))),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(task.icon, color: Colors.blue[300]),
                    SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Text(
                          "${task.title}",
                          style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width / 30,
                              color: Colors.blueGrey[300],
                              fontWeight: FontWeight.w300,
                              letterSpacing: 1.2,
                              fontFamily: "Anton"),
                        )),
                    SizedBox(
                      width: 20,
                    ),
                    Icon(Icons.arrow_forward, color: Colors.blue[200])
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

class PlusButton extends StatefulWidget {
  final VoidCallback onTap;

  const PlusButton({Key key, this.onTap}) : super(key: key);
  @override
  _PlusButtonState createState() => _PlusButtonState();
}

class _PlusButtonState extends State<PlusButton> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 30,
        child: GestureDetector(
          onTap: widget.onTap,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    color: Colors.blue[200], spreadRadius: 5, blurRadius: 25)
              ],
              color: Colors.blue.withOpacity(0.6),
            ),
            child: Icon(
              MaterialCommunityIcons.plus,
              color: Colors.white,
              size: 30,
            ),
            width: 100,
            height: 100,
          ),
        ));
  }
}

class Task {
  final String time;
  final String title;
  final String subTitle;
  final List<String> avatars;

  Task({
    this.time,
    this.subTitle,
    this.title,
    this.avatars,
  });
}

class TaskCard extends StatefulWidget {
  final List<Task> tasks;
  TaskCard({this.tasks});
  @override
  _TaskCardState createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
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
                    colors: [Colors.blue[200], Colors.blue[600]],
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
    this.avatars,
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
      }
    else if (_animationController[0].isCompleted)
      for (int i = _animationController.length - 1; i >= 0; i--) {
        await Future.delayed(Duration(milliseconds: 83));
        setState(() {
          _animationController[i].reverse();
        });
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
                        opacity: 1 - _animation[avatars.indexOf(avatar)].value,
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
                Icons.more_vert,
                color: Colors.blue[800],
                size: 28,
              ),
              onTap: () {
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
