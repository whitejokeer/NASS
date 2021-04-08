import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController urlImage = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: urlImage,
        ),
        TextButton(
          onPressed: () {},
          child: Text("Guardar"),
        ),
      ],
    );
  }
}
