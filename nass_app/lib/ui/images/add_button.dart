import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nass_app/ui/images/widgets/add_file.dart';

class AddButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? FloatingActionButton(
            onPressed: () {
              showDialog<void>(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext dialogContext) {
                  return AddFileCard();
                },
              );
            },
            backgroundColor: Theme.of(context).primaryColor,
            child: Icon(Icons.add),
          )
        : Center();
  }
}
