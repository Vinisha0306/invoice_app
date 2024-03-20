import 'package:flutter/material.dart';
import 'package:invoice_app/pages/build_options/PDFPage/PDFPage.dart';
import 'package:invoice_app/pages/build_options/company_details/company_details.dart';
import 'package:invoice_app/pages/build_options/customer_details/customer_details.dart';
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
        MyRoutes.SpleshScreensPage: (context) => const SpleshScreens(),
        MyRoutes.HomePage: (context) => const HomePage(),
        MyRoutes.BuildOptions[0]['route']: (context) => const CompanyDetails(),
        MyRoutes.BuildOptions[1]['route']: (context) => const InvoicePage(),
        MyRoutes.PDFPage: (context) => const PDFPage(),
      },
    );
  }
}
