import 'package:flutter/material.dart';

Widget textFieldWidget({
  required TextEditingController controller,
  required Function validator,
  bool obscureText = false,
  required String hintText,
  Widget? suffixIcon,
  int? maxLength,
  required TextInputType textInputType,
  required Color colorSide,
  Function(String? value)? onSaved,
  Function(String? value)? onChanged,
}) {
  return TextFormField(
    style: const TextStyle(color: Colors.white),
    controller: controller,
    validator: (value) => validator(value),
    obscureText: obscureText ? true : false,
    cursorColor: Colors.black,
    keyboardType: textInputType,
    maxLength: maxLength,
    onSaved: onSaved,
    onChanged: onChanged,
    decoration: InputDecoration(
      counterText: '',
      filled: true,
      hintText: hintText,
      hintStyle: const TextStyle(
        fontFamily: 'Cairo',
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      suffixIcon: suffixIcon,
      border: UnderlineInputBorder(
        borderSide: BorderSide(
          color: colorSide,
          width: 4,
        ),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: colorSide,
          width: 4,
        ),
      ),
      disabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: colorSide,
          width: 4,
        ),
      ),
      errorBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: colorSide,
          width: 4,
        ),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: colorSide,
          width: 4,
        ),
      ),
    ),
  );
}
