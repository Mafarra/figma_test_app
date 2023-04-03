import 'package:figma_test_app/utils/app_media.dart';
import 'package:flutter/services.dart';

import '../features/model/product_model.dart';

class AppConst {
  static const List<String> imageAsset = [
    AppMedia.parfum1,
    AppMedia.parfum1,
    AppMedia.parfum1,
    // AppMedia.parfum2,
    AppMedia.parfum4,
  ];
  static List<ProductModel> productsItems = [
    ProductModel(
      isChecked: true,
      img: AppMedia.parfum1,
      productName: "علب تعبئة",
      productPrice: "10 ر.س",
    ),
    ProductModel(
      isChecked: false,
      img: AppMedia.parfum2,
      productName: "علب تعبئة",
      productPrice: "10 ر.س",
    ),
    ProductModel(
      isChecked: true,
      img: AppMedia.parfum1,
      productName: "علب تعبئة",
      productPrice: "10 ر.س",
    ),
    ProductModel(
      isChecked: false,
      img: AppMedia.parfum2,
      productName: "علب تعبئة",
      productPrice: "10 ر.س",
    ),
  ];

  static double screenWidth = 375;
  static double screenHeight = 900;
  /*
AppConst.screenHeight >= 800
              ? AppConst.screenHeight / 1.5
              : AppConst.screenHeight / 1.2,
  */
  static void portraitOrientation() {
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
}
}
