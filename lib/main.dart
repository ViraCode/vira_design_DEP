import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:vira_design/chat/simple_chat.dart';
import 'package:vira_design/screens/about/card_about.dart';
import 'package:vira_design/screens/animation_ui/drawer_2d.dart';
import 'package:vira_design/screens/backdrop/backdrop_sample.dart';
import 'package:vira_design/screens/backdrop/custom_backdrop.dart';
import 'package:vira_design/screens/bottom_navigation_bars/convex_bottom_navigation_bar.dart';
import 'package:vira_design/screens/buttons/buttons.dart';
import 'package:vira_design/screens/dialog_box/custom_dialog_box.dart';
import 'package:vira_design/screens/main_screen.dart';
import 'package:vira_design/screens/product_page/sliver_product.dart';
import 'package:vira_design/screens/product_page/sliver_stacked_product.dart';
import 'package:vira_design/screens/settings/sectioned_settings_with_profile.dart';

import 'screens/animation_ui/drawer_3d.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VIRA Design',
      theme: ThemeData(
        backgroundColor: Colors.black,
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainScreen(),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case Drawer3d.route:
            return PageTransition(
              child: Drawer3d(),
              type: PageTransitionType.fade,
              settings: settings,
            );
          case Drawer2d.route:
            return PageTransition(
              child: Drawer2d(),
              type: PageTransitionType.fade,
              settings: settings,
            );
          case SimpleChat.route:
            return PageTransition(
              child: SimpleChat(),
              type: PageTransitionType.fade,
              settings: settings,
            );
          case SliverStackedProduct.route:
            return PageTransition(
              child: SliverStackedProduct(),
              type: PageTransitionType.fade,
              settings: settings,
            );
          case CustomDialogBox.route:
            return PageTransition(
              child: CustomDialogBox(),
              type: PageTransitionType.fade,
              settings: settings,
            );
          case CustomBackDrop.route:
            return PageTransition(
              child: CustomBackDrop(),
              type: PageTransitionType.fade,
              settings: settings,
            );
            break;
          case BackDropSmaple.route:
            return PageTransition(
              child: BackDropSmaple(),
              type: PageTransitionType.fade,
              settings: settings,
            );
            break;
          case ButtonPage.route:
            return PageTransition(
              child: ButtonPage(),
              type: PageTransitionType.fade,
              settings: settings,
            );
            break;
          case SectionedSettinsWithProfile.route:
            return PageTransition(
              child: SectionedSettinsWithProfile(),
              type: PageTransitionType.fade,
              settings: settings,
            );
            break;
          case CardAbout.route:
            return PageTransition(
              child: CardAbout(),
              type: PageTransitionType.fade,
              settings: settings,
            );
            break;
          case SliverProductPage.route:
            return PageTransition(
              child: SliverProductPage(),
              type: PageTransitionType.fade,
              settings: settings,
            );
            break;
          case ConvexBottomNavigationBar.route:
            return PageTransition(
              child: ConvexBottomNavigationBar(),
              type: PageTransitionType.fade,
              settings: settings,
            );
            break;
          default:
            return null;
        }
      },
    );
  }
}
