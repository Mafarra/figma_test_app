import 'package:figma_test_app/utils/app_media.dart';

import '../features/model/product_model.dart';

class AppConst {
  static const List<String> imageAsset = [
    AppMedia.parfum1,
    AppMedia.parfum1,
    AppMedia.parfum1,
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
}
