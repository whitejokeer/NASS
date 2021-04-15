import 'package:flutter/material.dart';

class SoftCard extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;
  final EdgeInsetsGeometry padding;

  const SoftCard({Key key, this.child, this.width, this.height, this.padding})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height ?? double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[500],
            offset: Offset(3.0, 3.0),
            blurRadius: 10.0,
          ),
          BoxShadow(
            color: Colors.white,
            offset: Offset(-3.0, -3.0),
            blurRadius: 10.0,
          ),
        ],
      ),
      child: Padding(
        padding: padding ?? EdgeInsets.all(16.0),
        child: child,
      ),
    );
  }
}
