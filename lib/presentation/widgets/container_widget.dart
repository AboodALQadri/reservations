import 'package:flutter/material.dart';
import 'package:reservation/presentation/widgets/text_utils.dart';

Widget containerWidget({
  required String text,
  required Color colorText,
  required Color backgroundColor,
  required Color borderColor,
}) {
  return Container(
    alignment: Alignment.center,
    height: 35,
    width: 65,
    decoration: BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(
        color: borderColor,
        width: 2,
      ),
    ),
    child: TextUtils(
      text: text,
      color: colorText,
      fontWeight: FontWeight.w600,
      fontSize: 12,
      underLine: TextDecoration.none,
    ),
  );
}
