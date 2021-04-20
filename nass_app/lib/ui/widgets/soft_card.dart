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
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[400],
            offset: Offset(4.0, 4.0),
            blurRadius: 15.0,
          ),
          BoxShadow(
            color: Colors.white,
            offset: Offset(-4.0, -4.0),
            blurRadius: 15.0,
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
