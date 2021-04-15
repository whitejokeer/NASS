import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_strategy/url_strategy.dart';

import 'config/colors.dart';
import 'ui/docs/docs_page.dart';
import 'ui/home/home_page.dart';
import 'ui/images/images_page.dart';
import 'ui/login/login_page.dart';
import 'ui/register/register_page.dart';
import 'ui/shared/shared_page.dart';
import 'ui/splash/splash_page.dart';
import 'ui/videos/videos_page.dart';

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
          headline1: GoogleFonts.titanOne(
            fontSize: 45.0,
            color: colorHookers,
          ),
          headline2: GoogleFonts.titanOne(
            fontSize: 40.0,
            color: colorHookers,
          ),
          headline3: GoogleFonts.titanOne(
            fontSize: 35.0,
            color: colorHookers,
          ),
          headline4: GoogleFonts.titanOne(
            fontSize: 30.0,
            color: colorHookers,
          ),
          headline5: GoogleFonts.titanOne(
            fontSize: 25.0,
            color: colorHookers,
          ),
          headline6: GoogleFonts.titanOne(
            fontSize: 20.0,
            color: colorHookers,
          ),
          subtitle1: GoogleFonts.taviraj(
            fontSize: 25.0,
            color: colorHookers,
          ),
          subtitle2: GoogleFonts.taviraj(
            fontSize: 18.0,
            color: colorHookers,
            fontWeight: FontWeight.w600,
          ),
          bodyText1: GoogleFonts.roboto(
            fontSize: 20.0,
            color: colorHookers,
          ),
          bodyText2: GoogleFonts.roboto(
            fontSize: 18.0,
            color: colorHookers,
          ),
        ),
        appBarTheme: AppBarTheme(
          color: Colors.grey[300],
          centerTitle: true,
          elevation: 0.0,
        ),
        primaryColor: colorTurquoise,
        scaffoldBackgroundColor: Colors.grey[300],
      ),
      initialRoute: '/splash',
      routes: routes,
    );
  }
}

final routes = {
  '/splash': (BuildContext context) => SplashPage(),
  '/': (BuildContext context) => HomePage(),
  '/login': (BuildContext context) => LoginPage(),
  '/register': (BuildContext context) => RegisterPage(),
  '/images': (BuildContext context) => ImagesPage(),
  '/videos': (BuildContext context) => VideosPage(),
  '/docs': (BuildContext context) => DocsPage(),
  '/shared': (BuildContext context) => SharedPage(),
};
