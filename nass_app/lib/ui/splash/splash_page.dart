import 'package:flutter/material.dart';
import 'package:yeet/yeet.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
              onPressed: () => context.yeet("/home"), child: Text("Home")),
          TextButton(
              onPressed: () => context.yeet("/login"), child: Text("Login")),
        ],
      ),
    );
  }
}
