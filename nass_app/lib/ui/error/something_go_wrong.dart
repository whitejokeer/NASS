import 'package:flutter/material.dart';

class SomethingGoWrong extends StatelessWidget {
  final String error;

  const SomethingGoWrong({Key key, this.error}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Algo a ido mal!\nIntentalo de nuevo en unos minutos\n$error",
          style: Theme.of(context).textTheme.headline3,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
