import 'package:flutter/material.dart';

Widget imageDetails({
  required imageUrl,
}) {
  return Container(
    width: double.infinity,
    height: 290,
    decoration: const BoxDecoration(
      color: Colors.white,
    ),
    child: Center(
      child: Container(
        width: 360,
        height: 240,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          image: DecorationImage(
            image: NetworkImage(
              imageUrl,
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    ),
  );
}
