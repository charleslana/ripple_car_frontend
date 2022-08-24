import 'package:flutter/material.dart';
import 'package:ripple_car_frontend/themes/colors_theme.dart';

TextStyle poppinsRegular({
  Color color = ThemeColor.primaryBlack,
  double fontSize = 16,
  FontWeight fontWeight = FontWeight.normal,
  String fontFamily = 'Poppins',
}) {
  return TextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: fontWeight,
    fontFamily: fontFamily,
  );
}
