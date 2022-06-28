import 'package:flutter/material.dart';

class TextUtils extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight fontWeight;
  final double fontSize;
  final TextDecoration? underLine;
  final TextOverflow? overFlow;

  const TextUtils({
    Key? key,
    required this.text,
    required this.color,
    required this.fontWeight,
    required this.fontSize,
    this.underLine,
    this.overFlow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Cairo',
        decoration: underLine,
        color: color,
        fontWeight: fontWeight,
        fontSize: fontSize,
        overflow: overFlow,
      ),
    );
  }
}
