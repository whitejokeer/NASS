import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:nass_app/config/config.dart';

class ResponsiveAppDesktop extends StatelessWidget {
  final Widget app;
  final Widget desktopApp;
  final Widget desktopWindow;

  const ResponsiveAppDesktop(
      {Key key,
      @required this.app,
      @required this.desktopApp,
      @required this.desktopWindow})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constrains) {
          print(constrains.maxWidth);
          if (Platform.isAndroid) {
            return app;
          } else if (constrains.maxWidth < appSizeConstrain) {
            return desktopApp;
          } else {
            return desktopWindow;
          }
        },
      ),
    );
  }
}
