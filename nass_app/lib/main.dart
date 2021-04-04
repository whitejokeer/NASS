import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nass_app/config/colors.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(ProviderScope(child: NassApp()));
}

class NassApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NASS',
      theme: ThemeData(
        textTheme: TextTheme(
          headline1: GoogleFonts.titanOne(fontSize: 35.0),
          headline2: GoogleFonts.titanOne(fontSize: 30.0),
          headline3: GoogleFonts.titanOne(fontSize: 25.0),
          headline4: GoogleFonts.titanOne(fontSize: 20.0),
          headline5: GoogleFonts.titanOne(fontSize: 15.0),
          headline6: GoogleFonts.titanOne(fontSize: 10.0),
          subtitle1: GoogleFonts.taviraj(fontSize: 10.0),
          subtitle2: GoogleFonts.taviraj(fontSize: 15.0),
          bodyText1: GoogleFonts.roboto(fontSize: 10.0),
          bodyText2: GoogleFonts.roboto(fontSize: 15.0),
        ),
        primaryColor: colorTurquoise,
      ),
      home: Scaffold(),
    );
  }
}
