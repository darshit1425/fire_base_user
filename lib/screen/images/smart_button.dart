import 'package:flutter/material.dart';

import 'font_style.dart';

Widget ourButton({onPress, color, textColor, String? title}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      primary: color,
      padding: EdgeInsets.all(12),
    ),
    onPressed: onPress,
    child: Text(
      title ?? "",
      style: TextStyle(fontFamily: bold, color: textColor),
    ),
  );
}
