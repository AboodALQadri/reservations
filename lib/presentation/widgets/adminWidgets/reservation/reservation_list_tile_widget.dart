import 'package:flutter/material.dart';
import 'package:reservation/constants/my_colors.dart';
import 'package:reservation/presentation/widgets/text_utils.dart';

Widget reservationListTileWidget({
  required imageUrl,
  required String title,
  required String subtitle,
  required String state,
}) {
  return Container(
    alignment: Alignment.center,
    width: 328,
    height: 140,
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.white.withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 1,
        ),
      ],
      borderRadius: BorderRadius.circular(8),
    ),
    child: ListTile(
      leading: Container(
        height: 80,
        width: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          image: DecorationImage(
            image: NetworkImage(
              imageUrl,
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
      title: TextUtils(
        text: title,
        overFlow: TextOverflow.ellipsis,
        color: Colors.black,
        fontWeight: FontWeight.w400,
        fontSize: 16,
      ),
      subtitle: TextUtils(
        text: subtitle,
        overFlow: TextOverflow.ellipsis,
        color: MyColors.kWhiteColor,
        fontWeight: FontWeight.w600,
        fontSize: 12,
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          InkWell(
            onTap: () {},
            child: Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                color: MyColors.kWhiteColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                Icons.close,
                size: 20,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: 30,
            width: 70,
            decoration: BoxDecoration(
              color: MyColors.kGreenColor,
              borderRadius: BorderRadius.circular(4),
            ),
            child: TextUtils(
              text: state,
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 12,
            ),
          ),
        ],
      ),
    ),
  );
}
