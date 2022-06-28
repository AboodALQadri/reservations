import 'package:flutter/material.dart';
import 'package:reservation/constants/my_colors.dart';
import 'package:reservation/presentation/widgets/text_utils.dart';

Widget containerDayWidget({
  required String textDayTime,
  required String timeText,
  required Color borderColor,
  required Color dayTextColor,
  required Color timeColor,
}) {
  return Container(
    height: 126,
    width: 125,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(25),
      border: Border.all(
        color: borderColor,
        width: 2,
      ),
    ),
    child: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 80,
            width: 80,
            child: TextUtils(
              text: textDayTime,
              color: dayTextColor,
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
          Divider(
            color: MyColors.kPrimaryColor.withOpacity(0.2),
            thickness: 2,
          ),
          TextUtils(
            text: timeText,
            color: timeColor,
            fontWeight: FontWeight.w400,
            fontSize: 13,
          ),
        ],
      ),
    ),
  );
}
