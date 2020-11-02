import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:vira_design/screens/bottom_navigation_bars/convex_bottom_navigation_bar.dart';
import 'package:vira_design/screens/main_screen.dart';
import 'package:vira_design/screens/product_page/sliver_product.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainScreen(),
      onGenerateRoute: (settings) {
        switch (settings.name) {
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
