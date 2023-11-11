import 'package:crypto_app/size_config.dart';
import 'package:flutter/material.dart';

Widget buildText(
    {required String data,
    double? fontSize,
    FontWeight? fontWeight,
    Color? color}) {
  return Text(data,
      style: TextStyle(
          fontSize: fontSize ?? f10,
          fontWeight: fontWeight ?? FontWeight.w500,
          color: color ?? Colors.black));
}
