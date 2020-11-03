import 'package:flutter/material.dart';
// import 'package:easy_localization/easy_localization.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';
import 'package:flutter_icons/flutter_icons.dart';

//import 'package:sky_engine/ui/ui.dart';
class SectionedSettinsWithProfile extends StatefulWidget {
  static const String route = "/settings/sectioned_settings_with_profile";
  static const String name = "Sectioned Settins With Profile";
  @override
  SettinsWithProfileState createState() => SettinsWithProfileState();
}

class SettinsWithProfileState extends State<SectionedSettinsWithProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Options"),
        flexibleSpace: WaveBar(),
        centerTitle: true,
      ),
      body: Container(
          //margin: EdgeInsets.all(7),
          // color: HexColor.fromHex('#Eae7ff'),
          child: ListView(
        padding: EdgeInsets.all(7),
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Faramarz Sangi",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 9,
                    ),
                    Text("Computer Engnieering",
                        style: TextStyle(fontSize: 12, color: Colors.black38)),
                  ],
                ),
                Expanded(
                  child: Container(),
                ),
                Column(
                  children: [
                    CircleAvatar(
                      radius: 45,
                      child: Icon(
                        Icons.person,
                        size: 35,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    RaisedButton.icon(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(60)),
                      onPressed: () {},
                      icon: Icon(
                        Icons.edit,
                      ),
                      label: Text("Edit Profile"),
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            child: Container(
              margin: EdgeInsets.fromLTRB(40, 5, 40, 10),
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(60)),
            ),
            height: 4,
            width: 10,
          ),
          itemBuilder("Location", Icon(FontAwesome.search)),
          itemBuilder('category', Icon(Icons.category_sharp)),
          itemBuilder('settings', Icon(Feather.settings)),
          itemBuilder('about', Icon(Icons.details)),
          itemBuilder('donate', Icon(Icons.money_sharp))
        ],
      )),
    );
  }

  itemBuilder(child, icon) {
    return Container(
      padding: EdgeInsets.zero,
      child: Card(
        child: ListTile(
          leading: icon,
          title: Text(child),
          onTap: () {},
        ),
      ),
    );
  }
}

class WaveBar extends StatefulWidget {
  @override
  _WaveBarState createState() => _WaveBarState();
}

class _WaveBarState extends State<WaveBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RotatedBox(
        quarterTurns: 2,
        child: WaveWidget(
          config: CustomConfig(
            gradients: [
              [Colors.blue, Colors.blue],
              [Colors.blue[800], Colors.blue[900]],
              [Colors.blueGrey, Colors.blueGrey[50]],
              [Colors.blueAccent, Colors.blueAccent[100]]
            ],
            durations: [35000, 19440, 10800, 6000],
            heightPercentages: [0.26, 0.29, 0.34, 0.39],
            blur: MaskFilter.blur(BlurStyle.solid, 10),
            gradientBegin: Alignment.topLeft,
            gradientEnd: Alignment.bottomRight,
          ),
          waveAmplitude: 0,
          size: Size(
            double.infinity,
            double.infinity,
          ),
        ),
      ),
    );
  }
}
