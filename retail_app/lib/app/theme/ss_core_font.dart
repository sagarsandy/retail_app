import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

String? fontFamily({required FontWeight fontWeight}) {
  return GoogleFonts.openSans(
    fontWeight: fontWeight,
  ).fontFamily;
}

enum FontWeightType {
  normal,
  bold,
  extraBold,
}

FontWeight normalFont() {
  return FontWeight.w500;
}

FontWeight boldFont() {
  return FontWeight.w700;
}

FontWeight extraBoldFont() {
  return FontWeight.w800;
}

FontWeight getFontWeight(FontWeightType fontWeightType) {
  switch (fontWeightType) {
    case FontWeightType.normal:
      return normalFont();
    case FontWeightType.bold:
      return boldFont();
    case FontWeightType.extraBold:
      return extraBoldFont();
  }
}
