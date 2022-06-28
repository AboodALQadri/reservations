import 'package:flutter/material.dart';
import 'package:reservation/constants/my_colors.dart';
import 'package:reservation/presentation/widgets/text_utils.dart';

Widget productInfo({required String textInfo}) {
  return SingleChildScrollView(
    padding: const EdgeInsets.only(left: 55),
    scrollDirection: Axis.horizontal,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: MyColors.kWhiteColor,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        TextUtils(
          text: textInfo,
          overFlow: TextOverflow.ellipsis,
          color: MyColors.kWhiteColor,
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
      ],
    ),
  );
}
