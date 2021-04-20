import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nass_app/controllers/provider_handler.dart';
import 'package:nass_app/ui/error/something_go_wrong.dart';
import 'package:nass_app/ui/home/app_layout.dart';
import 'package:nass_app/ui/widgets/progress_indicator.dart';

import 'desktop_app_layout.dart';
import 'desktop_layout.dart';

class HomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final homeProvider = watch(homeDataProvider);
    return homeProvider.when(
      data: (data) => LayoutBuilder(
        builder: (context, constrains) {
          if (Platform.isAndroid) {
            return AppHomePage(
              storageUsed: data.usado,
              storageAvailable: data.disponible,
              admin: data.admin,
            );
          } else if ((constrains.maxWidth < 800)) {
            return DesktopAppHomePage(
              storageUsed: data.usado,
              storageAvailable: data.disponible,
              admin: data.admin,
            );
          } else {
            return DesktopHomePage(
              storageUsed: data.usado,
              storageAvailable: data.disponible,
              storageImage: data.usadoImg,
              storageVideo: data.usadoVideo,
              storageDocs: data.usadoDoc,
              admin: data.admin,
            );
          }
        },
      ),
      loading: () => Scaffold(body: Center(child: CircularNassIndicator())),
      error: (e, s) => SomethingGoWrong(
        error: s.toString(),
      ),
    );
  }
}
