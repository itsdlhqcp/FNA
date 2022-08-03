import 'dart:async';

import 'package:efotballactseller_app/views/screens/bottom_navbar.dart';
import 'package:efotballactseller_app/views/screens/home_screens.dart';
import 'package:flutter/material.dart';

class splashScreen extends StatefulWidget {
  splashScreen({Key? key}) : super(key: key);

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds:5), (){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>BottomNavBar()));
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/deliver.png",
            scale: 2,
          )
        ],
      )),
    );
  }
}
