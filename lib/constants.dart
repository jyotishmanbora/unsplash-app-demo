import 'package:flutter/material.dart';

TextStyle nunitoText = TextStyle(
  color: Colors.white,
  fontFamily: 'Nunito',
);

TextStyle poppinsStyle(BuildContext context, double? size) {
  return DefaultTextStyle.of(context).style.copyWith(
        color: Colors.white,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w700,
        decoration: TextDecoration.none,
        fontSize: size,
      );
}
