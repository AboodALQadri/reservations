import 'package:flutter/material.dart';
import 'package:reservation/constants/my_colors.dart';
import 'package:reservation/presentation/widgets/text_utils.dart';

Widget listTileWidget({
  required imageUrl,
  required String title,
  required String subtitle,
}) {
  return Container(
    padding: const EdgeInsets.only(top: 25, bottom: 20),
    width: 328,
    height: 120,
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.white.withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 1,
        ),
      ],
      borderRadius: BorderRadius.circular(10),
    ),
    child: ListTile(
      leading: Container(
        // margin: EdgeInsets.all(10),
        // clipBehavior: Clip.antiAlias,
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
    ),
  );
}
