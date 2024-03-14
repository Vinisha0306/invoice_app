import 'dart:async';

import 'package:flutter/material.dart';

import '../../utils/routes_utils.dart';

class SpleshScreens extends StatefulWidget {
  const SpleshScreens({super.key});

  @override
  State<SpleshScreens> createState() => _SpleshScreensState();
}

class _SpleshScreensState extends State<SpleshScreens> {
  @override
  void initState() {
    Timer.periodic(
      Duration(seconds: 3),
      (tick) {
        Navigator.pushReplacementNamed(context, MyRoutes.HomePage);
        tick.cancel();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 183, 153, 255),
          image: DecorationImage(
            image: AssetImage('lib/assets/images/WayBill.png'),
          ),
        ),
      ),
    );
  }
}
