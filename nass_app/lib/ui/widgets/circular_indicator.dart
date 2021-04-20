import 'package:flutter/material.dart';

class CircularIndicator extends StatelessWidget {
  final num storage;
  final num storageAvailable;
  final double radio;
  final double internalRadio;
  final Color color;
  final double textSize;
  final double textInnerSize;

  const CircularIndicator(
      {Key key,
      @required this.storage,
      this.internalRadio = 100.0,
      this.radio = 130.0,
      this.color,
      this.textSize,
      this.textInnerSize,
      @required this.storageAvailable})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: radio,
      height: radio,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.grey[500],
            offset: Offset(3.0, 3.0),
            blurRadius: 8.0,
          ),
          BoxShadow(
            color: Colors.white,
            offset: Offset(-3.0, -3.0),
            blurRadius: 8.0,
          ),
        ],
      ),
      child: Stack(
        children: [
          Center(
            child: RotatedBox(
              quarterTurns: 3,
              child: ShaderMask(
                shaderCallback: (rect) {
                  return SweepGradient(
                    startAngle: 0.0,
                    endAngle: 3.14 * 2,
                    stops: [storage / storageAvailable, 0.0],
                    center: Alignment.center,
                    colors: [
                      color ?? Theme.of(context).primaryColor,
                      Colors.grey[400].withOpacity(0.4),
                    ],
                  ).createShader(rect);
                },
                child: Container(
                  width: radio,
                  height: radio,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              width: internalRadio,
              height: internalRadio,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                shape: BoxShape.circle,
              ),
              child: Align(
                alignment: Alignment.center,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: '${storage.toStringAsFixed(2)} Gb\n',
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: textSize ??
                              Theme.of(context).textTheme.bodyText1.fontSize,
                        ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'usados',
                        style: Theme.of(context).textTheme.bodyText2.copyWith(
                              fontSize: (textInnerSize ??
                                  Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      .fontSize),
                            ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
