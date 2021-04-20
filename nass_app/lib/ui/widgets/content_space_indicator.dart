import 'package:flutter/material.dart';
import 'package:nass_app/config/config.dart';

import 'circular_indicator.dart';

class ContentSpaceIndicator extends StatelessWidget {
  final num storageUsed;
  final num storageAvailable;
  final Color color;
  final String storageType;

  const ContentSpaceIndicator(
      {Key key,
      @required this.storageUsed,
      @required this.color,
      @required this.storageType,
      @required this.storageAvailable})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Flexible(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Container(
                width: double.infinity,
                child: Text(
                  "$storageType",
                  style: Theme.of(context).textTheme.subtitle1.copyWith(
                      fontSize:
                          MediaQuery.of(context).size.width < appSizeConstrain
                              ? 15
                              : 18.0),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          Flexible(
            flex: 2,
            child: Center(
              child: CircularIndicator(
                storage: storageUsed,
                storageAvailable: storageAvailable,
                radio: 100,
                internalRadio: 75,
                color: color,
                textSize: 15,
                textInnerSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
