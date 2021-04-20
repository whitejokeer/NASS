import 'package:flutter/material.dart';

class CircularNassIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      backgroundColor: Theme.of(context).primaryColor,
      valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
    );
  }
}
