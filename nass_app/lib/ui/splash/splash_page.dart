import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 2,
      ),
    );
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.bounceInOut,
    );
    animationController.forward();
    startTimer();
    super.initState();
  }

  startTimer() {
    var duration = new Duration(seconds: 3);
    return new Timer(duration, navigatorPage);
  }

  /// Function to define the next page based in the presence of a user token.
  navigatorPage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString("token") == null ||
        prefs.getString("token") == "null") {
      Navigator.pushReplacementNamed(context, "/login");
    } else {
      Navigator.pushReplacementNamed(context, "/home");
    }
  }

  @override
  dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ScaleTransition(
          scale: animation,
          child: Image.asset("assets/cloud_illustration.png"),
        ),
      ),
    );
  }
}
