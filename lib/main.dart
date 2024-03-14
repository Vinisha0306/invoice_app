import 'package:flutter/material.dart';
import 'package:invoice_app/pages/build_options/build_options_page.dart';
import 'package:invoice_app/pages/home_page/home_page.dart';
import 'package:invoice_app/pages/splesh_screens/splesh_screens.dart';
import 'package:invoice_app/utils/routes_utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Color.fromARGB(255, 183, 153, 255),
      ),
      routes: {
        MyRoutes.SpleshScreensPage: (context) => SpleshScreens(),
        MyRoutes.HomePage: (context) => HomePage(),
        MyRoutes.BuildOptionPage: (context) => BuildOptionPage(),
      },
    );
  }
}
