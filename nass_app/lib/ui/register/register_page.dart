import 'dart:io';

import 'package:flutter/material.dart';

import 'app_layout.dart';
import 'desktop_view.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constrains) {
          if (0 == 0.0) {
            return Center(child: RegisterDesktopView(),);
          } else if (Platform.isAndroid) {
            return RegisterAppLayout();
          } else {
            return Center(child: RegisterDesktopView(),);
          }
        },
      ),
    );
  }
}
