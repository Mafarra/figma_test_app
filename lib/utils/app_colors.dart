import 'package:flutter/material.dart';

class AppColor {
  static Color primaryColor = HexColor.fromHex("#3AC2CB");
  static Color headLineColor = HexColor.fromHex("#5F5F5F");
  static Color goldColor = HexColor.fromHex("#FFAA04");
  static Color detailsColor = HexColor.fromHex("#9A9A9A");
  static Color blackColor = HexColor.fromHex("#353535");
  static Color greenColor = HexColor.fromHex("#3AC2CB");
  static Color greenWhiteColor = HexColor.fromHex("#3AC2CB4D");
  static Color greenYelowColor = HexColor.fromHex("#02B503");
  static Color whiteColor = HexColor.fromHex("#FFFFFF");
  static Color redColor = HexColor.fromHex("#EF476F");
  static Color greyColor = HexColor.fromHex("#FAFAFA");
  static Color darkGreyColor = HexColor.fromHex("#5F5F5F");
  static Color whiteGreyColor = HexColor.fromHex("#D9D9D9");
  static Color whiteBlueColor = HexColor.fromHex("#F2F6FC");
  static Color whiteblackColor = HexColor.fromHex("#A0A0A0");
  static Color progressBackGround = HexColor.fromHex("#E0E0E0");
}

extension HexColor on Color {
  static fromHex(String hexColor) {
    hexColor = hexColor.replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return Color(int.parse(hexColor, radix: 16));
  }
}
