import 'package:flutter/material.dart';

class MyColors {
  static Color kPrimaryColor = const Color(0xff1597E5);
  static Color kRedColor = const Color(0xffE51515);
  static Color kPurpleColor = const Color(0xff5F06A6);
  static Color kWhiteColor = const Color(0xffAEAEAE);
  static Color kGreenColor = const Color(0xff06A62C);
  static Color kTabColor = const Color(0xff003479).withOpacity(0.7);
}

Widget ScreenStyle({Widget? child}) {
  return Container(
    width: double.infinity,
    height: double.infinity,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomLeft,
        // end: Alignment(1, 0.9),
        colors: <Color>[
           MyColors.kPrimaryColor,
           Colors.black.withOpacity(0.9),
        ],
      ),
    ),
    child: child,
  );
}

Widget AdminScreenStyle({Widget? child}) {
  return Container(
    width: double.infinity,
    height: double.infinity,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomLeft,
        // end: Alignment(1, 0.9),
        colors: <Color>[
           MyColors.kGreenColor,
           Colors.black.withOpacity(0.9),
        ],
      ),
    ),
    child: child,
  );
}
