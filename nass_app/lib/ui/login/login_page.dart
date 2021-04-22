import 'dart:io' show Platform;

import 'package:flutter/material.dart';

import 'app_layout.dart';
import 'desktop_app_view.dart';
import 'desktop_view.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constrains) {
          if (0 == 0.0) {
            if (constrains.maxWidth < 600) {
              return Center(child: DesktopAppView());
            } else {
              return Center(child: DesktopView());
            }
          } else if (Platform.isAndroid) {
            return AppLayout();
          } else {
            if (constrains.maxWidth < 600) {
              return Center(child: DesktopAppView());
            } else {
              return Center(child: DesktopView());
            }
          }
        },
      ),
    );
  }
}
