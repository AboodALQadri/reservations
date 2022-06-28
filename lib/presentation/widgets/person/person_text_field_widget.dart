import 'package:flutter/material.dart';
import 'package:reservation/constants/my_colors.dart';

Widget personTextFieldWidget({
  required TextEditingController controller,
  required Function validator,
  required String hintText,
  required Widget suffixIcon,
  int? maxLength,
  TextInputType? textInputType,
  bool readOnly = false,
}) {
  return Container(
    margin: const EdgeInsets.only(top: 10),
    height: 50,
    width: 330,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: Colors.white,
    ),
    child: TextFormField(
      controller: controller,
      validator: (value) => validator(value),
      cursorColor: Colors.black,
      maxLength: maxLength,
      keyboardType: textInputType,
      readOnly: readOnly,
      decoration: InputDecoration(
        fillColor: MyColors.kWhiteColor.withOpacity(0.1),
        counterText: '',
        filled: true,
        hintText: hintText,
        hintStyle: const TextStyle(
          fontFamily: 'Cairo',
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        suffixIcon: suffixIcon,
        border: const UnderlineInputBorder(borderSide: BorderSide.none),
        enabledBorder: const UnderlineInputBorder(borderSide: BorderSide.none),
        disabledBorder: const UnderlineInputBorder(borderSide: BorderSide.none),
        errorBorder: const UnderlineInputBorder(borderSide: BorderSide.none),
        focusedBorder: const UnderlineInputBorder(borderSide: BorderSide.none),
      ),
    ),
  );
}
