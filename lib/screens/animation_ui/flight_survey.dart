import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class FlightSurvey extends StatefulWidget {
  FlightSurvey({Key key}) : super(key: key);
  static const String name = "Flight Survey";
  static const String route = "/animation_ui/flight_survey";
  @override
  _FlightSurveyState createState() => _FlightSurveyState();
}

class _FlightSurveyState extends State<FlightSurvey> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[900],
        body: Container(
            child: SafeArea(
                child: Stack(alignment: Alignment.center, children: [
          ArrowIcons(),
          Plane(),
          BackButton(),
          Line(),
          Page(
            number: "02",
            question: "Who are you and is this personal?",
            answers: ["I am my fathers son", "I am my Mothers "],
            onOptionSelected: () {},
          ),
        ]))));
  }
}

class Page extends StatefulWidget {
  final String question;
  final String number;
  final VoidCallback onOptionSelected;
  final List<String> answers;
  Page(
      {@required this.question,
      @required this.number,
      @required this.onOptionSelected,
      @required this.answers});

  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Page> {
  List<GlobalKey<_ItemFaderState>> keys;
  // GlobalKey myKey = GlobalKey();
  @override
  void initState() {
    keys = List.generate(
        widget.answers.length + 2, (index) => GlobalKey<_ItemFaderState>());
    onInit();
    super.initState();
  }

  void onInit() async {
    for (GlobalKey<_ItemFaderState> key in keys) {
      await Future.delayed(Duration(milliseconds: 40));
      key.currentState.show();
    }
  }

  void onTap() async {
    for (GlobalKey<_ItemFaderState> key in keys) {
      await Future.delayed(Duration(milliseconds: 40));
      key.currentState.hide();
    }

    widget.onOptionSelected();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: MediaQuery.of(context).size.width * 0.1 + 16,
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              ItemFader(
                key: keys[0],
                child: Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Text(widget.number,
                      style: TextStyle(
                          color: Colors.blueGrey[200],
                          fontSize: MediaQuery.of(context).size.width * 0.2,
                          letterSpacing: 1.2,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              ItemFader(
                key: keys[1],
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  padding: const EdgeInsets.only(left: 50),
                  child: Text(widget.question,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          letterSpacing: 1.2,
                          fontWeight: FontWeight.w700)),
                ),
              ),
              Spacer(),
              ...widget.answers.map((e) => ItemFader(
                  key: keys[widget.answers.indexOf(e) + 2],
                  child: OptionItem(
                    option: e,
                    onTap: onTap,
                    faderkey: keys[widget.answers.indexOf(e) + 2],
                  ))),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
            ],
          ),
        ));
  }
}

class OptionItem extends StatefulWidget {
  final String option;
  final GlobalKey<_ItemFaderState> faderkey;
  final Function onTap;
  OptionItem({
    Key key,
    @required this.option,
    @required this.onTap,
    @required this.faderkey,
  }) : super(key: key);
  @override
  _OptionItemState createState() => _OptionItemState();
}

class _OptionItemState extends State<OptionItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap();
        // RenderBox object = context.findRenderObject();
        // Offset globalPosition = object.localToGlobal(Offset.zero);
        // print("ccc = ${globalPosition.dy} and ");
        // widget.faderkey.currentState.animateDot(globalPosition);
      },
      child: Container(
          margin: EdgeInsets.only(top: 50),
          child: Row(
            // key: myKey,
            children: [
              Icon(
                Icons.circle,
                color: Colors.white,
                size: 15,
              ),
              SizedBox(
                width: 15,
              ),
              Text(widget.option,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      letterSpacing: 1.2,
                      fontWeight: FontWeight.w600)),
            ],
          )),
      // onTap: widget.onOptionSelected,
    );
  }
}

class ItemFader extends StatefulWidget {
  final Widget child;
  ItemFader({Key key, @required this.child}) : super(key: key);
  @override
  _ItemFaderState createState() => _ItemFaderState();
}

class _ItemFaderState extends State<ItemFader>
    with SingleTickerProviderStateMixin {
  int position = 1;
  AnimationController _animationController;
  Animation _animation;
  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut);
    super.initState();
  }

  Future<void> animateDot(Offset startOffset) async {
    OverlayEntry entry = OverlayEntry(builder: (context) {
      double minTop = MediaQuery.of(context).padding.top + 52;
      return AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Positioned(
              left: MediaQuery.of(context).size.width * 0.1 + 16,
              // top: startOffset.dy -
              //     (-_animationController.value * startOffset.dy),
              top: minTop +
                  (startOffset.dy - minTop) * (1 - _animationController.value),
              child: child);
        },
        child: Icon(
          Icons.circle,
          color: Colors.white,
          size: 15,
        ),
      );
    });
    Overlay.of(context).insert(entry);
    await _animationController.forward();
    entry.remove();
  }

  void show() {
    setState(() {
      _animationController.forward();
    });
  }

  void hide() {
    setState(() {
      position = -1;
      _animationController.reverse();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animation,
        child: widget.child,
        builder: (_, child) {
          return Transform.translate(
            offset: Offset(0, 64 * position * (1 - _animation.value)),
            child: Opacity(
              opacity: _animation.value,
              child: child,
            ),
          );
        });
  }
}

class ArrowIcons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: MediaQuery.of(context).size.height * 0.05,
        left: MediaQuery.of(context).size.width * 0.05,
        child: Column(
          children: [
            Icon(
              Icons.arrow_upward,
              color: Colors.white,
              size: 20,
            ),
            Icon(
              Icons.arrow_downward,
              color: Colors.white,
              size: 20,
            )
          ],
        ));
  }
}

class Line extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: MediaQuery.of(context).size.height * 0.1 + 22,
        left: MediaQuery.of(context).size.width * 0.1 + 22,
        child: Container(
          width: 2,
          height: MediaQuery.of(context).size.height,
          color: Colors.white.withOpacity(0.3),
        ));
  }
}

class Plane extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: MediaQuery.of(context).size.height * 0.1,
        left: MediaQuery.of(context).size.width * 0.1,
        child: RotatedBox(
            quarterTurns: 1,
            child: Icon(
              Ionicons.ios_airplane,
              color: Colors.white,
              size: 50,
            )));
  }
}

class BackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 20,
        left: 20,
        child: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ));
  }
}
