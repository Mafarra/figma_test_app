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
