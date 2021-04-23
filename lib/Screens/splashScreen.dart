import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_day_3/Screens/screenWithButton.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 5), () {
      int x = 20;
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ScreenWithButton()),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Center(child: Image.asset('images/flutterLogo.png')),
    );
  }
}
