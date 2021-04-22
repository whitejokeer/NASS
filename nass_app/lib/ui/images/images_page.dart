import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nass_app/config/colors.dart';
import 'package:nass_app/ui/images/add_button.dart';
import 'package:nass_app/ui/images/image_grid.dart';

class ImagesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios_outlined,
            color: colorHookers,
            size: 40.0,
          ),
        ),
        title: Text(
          'Imagenes',
          style: Theme.of(context)
              .textTheme
              .headline4
              .copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: AddButton(),
      body: CustomScrollView(
        slivers: [
          ImagesGridBuilder(),
        ],
      ),
    );
  }
}
