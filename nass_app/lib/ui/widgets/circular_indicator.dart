import 'package:flutter/material.dart';

class CircularIndicator extends StatelessWidget {
  final double storage;

  const CircularIndicator({Key key, @required this.storage}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 135,
      height: 135,
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
                    stops: [storage / 10.0, 0.0],
                    center: Alignment.center,
                    colors: [
                      Theme.of(context).primaryColor,
                      Colors.grey[400].withOpacity(0.4),
                    ],
                  ).createShader(rect);
                },
                child: Container(
                  width: 130.0,
                  height: 130.0,
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
              width: 100.0,
              height: 100.0,
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
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .copyWith(fontWeight: FontWeight.bold),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'usados',
                          style: Theme.of(context).textTheme.bodyText2,
                        )
                      ]),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
