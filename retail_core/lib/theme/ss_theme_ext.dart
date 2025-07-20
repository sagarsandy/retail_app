import 'package:flutter/material.dart';
import 'package:retail_core/theme/ss_core_font.dart';

enum FontWeightType { normal, bold, extraBold }

extension BaseTextTheme on TextTheme {
  TextStyle tiny(
    Color color, {
    bool isUnderLine = false,
    bool isStrikeThrough = false,
    FontWeightType fontWeight = FontWeightType.normal,
  }) {
    return TextStyle(
      color: color,
      fontFamily: fontFamily(fontWeight: getFontWeight(fontWeight)),
      fontSize: 8,
      decorationThickness: 3.0,
      decorationColor: color,
      decoration:
          isStrikeThrough
              ? TextDecoration.lineThrough
              : isUnderLine
              ? TextDecoration.underline
              : TextDecoration.none,
    );
  }

  TextStyle small(
    Color color, {
    bool isUnderLine = false,
    bool isStrikeThrough = false,
    FontWeightType fontWeight = FontWeightType.normal,
  }) {
    return TextStyle(
      color: color,
      fontFamily: fontFamily(fontWeight: getFontWeight(fontWeight)),
      fontSize: 10,
      decorationThickness: 3.0,
      decorationColor: color,
      decoration:
          isStrikeThrough
              ? TextDecoration.lineThrough
              : isUnderLine
              ? TextDecoration.underline
              : TextDecoration.none,
    );
  }

  TextStyle regular(
    Color color, {
    bool isUnderLine = false,
    bool isStrikeThrough = false,
    FontWeightType fontWeight = FontWeightType.normal,
  }) {
    return TextStyle(
      color: color,
      fontFamily: fontFamily(fontWeight: getFontWeight(fontWeight)),
      fontSize: 12,
      decorationThickness: 3.0,
      decorationColor: color,
      decoration:
          isStrikeThrough
              ? TextDecoration.lineThrough
              : isUnderLine
              ? TextDecoration.underline
              : TextDecoration.none,
    );
  }

  TextStyle medium(
    Color color, {
    bool isUnderLine = false,
    bool isStrikeThrough = false,
    FontWeightType fontWeight = FontWeightType.normal,
  }) {
    return TextStyle(
      color: color,
      fontFamily: fontFamily(fontWeight: getFontWeight(fontWeight)),
      fontSize: 14,
      decorationThickness: 3.0,
      decorationColor: color,
      decoration:
          isStrikeThrough
              ? TextDecoration.lineThrough
              : isUnderLine
              ? TextDecoration.underline
              : TextDecoration.none,
    );
  }

  TextStyle large(
    Color color, {
    bool isUnderLine = false,
    bool isStrikeThrough = false,
    FontWeightType fontWeight = FontWeightType.normal,
  }) {
    return TextStyle(
      color: color,
      fontFamily: fontFamily(fontWeight: getFontWeight(fontWeight)),
      fontSize: 16,
      decorationThickness: 3.0,
      decorationColor: color,
      decoration:
          isStrikeThrough
              ? TextDecoration.lineThrough
              : isUnderLine
              ? TextDecoration.underline
              : TextDecoration.none,
    );
  }

  TextStyle extraLarge(
    Color color, {
    bool isUnderLine = false,
    bool isStrikeThrough = false,
    FontWeightType fontWeight = FontWeightType.normal,
  }) {
    return TextStyle(
      color: color,
      fontFamily: fontFamily(fontWeight: getFontWeight(fontWeight)),
      fontSize: 20,
      decorationThickness: 3.0,
      decorationColor: color,
      decoration:
          isStrikeThrough
              ? TextDecoration.lineThrough
              : isUnderLine
              ? TextDecoration.underline
              : TextDecoration.none,
    );
  }

  TextStyle custom(
    Color color, {
    double fontSize = 24,
    bool isUnderLine = false,
    bool isStrikeThrough = false,
    FontWeightType fontWeight = FontWeightType.normal,
  }) {
    return TextStyle(
      color: color,
      fontFamily: fontFamily(fontWeight: getFontWeight(fontWeight)),
      fontSize: fontSize,
      decorationThickness: 3.0,
      decorationColor: color,
      decoration:
          isStrikeThrough
              ? TextDecoration.lineThrough
              : isUnderLine
              ? TextDecoration.underline
              : TextDecoration.none,
    );
  }
}
