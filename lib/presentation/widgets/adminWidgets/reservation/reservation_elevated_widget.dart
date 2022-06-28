import 'package:flutter/material.dart';

Widget reservationElevatedWidget({
  required String title,
  required Color color,
  required Function() onPressed,
  Color borderSideColor = Colors.blue,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(160, 48),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
          side: BorderSide(
            color: borderSideColor,
          ),
        ),
        primary: color,
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: const TextStyle(
          fontFamily: 'Cairo',
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
