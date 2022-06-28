import 'package:flutter/material.dart';
import 'package:reservation/presentation/widgets/text_utils.dart';

Widget containerReturnWidget({
  required String textReturnTime,
  required String textDay,
}) {
  return Container(
    height: 120,
    width: 140,
    decoration: BoxDecoration(
      color: Colors.blue.withOpacity(0.1),
      borderRadius: BorderRadius.circular(60),
      //
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextUtils(
          text: textReturnTime,
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 14,
          overFlow: TextOverflow.ellipsis,

        ),
        TextUtils(
          text: textDay,
          color: Colors.black54,
          fontWeight: FontWeight.bold,
          fontSize: 14,
          overFlow: TextOverflow.ellipsis,
        ),
      ],
    ),
  );
}
