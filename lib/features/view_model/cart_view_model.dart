import 'package:figma_test_app/features/view/app_widgets/app_widgets.dart';
import 'package:figma_test_app/utils/app_const.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../view/app_widgets/home_slider.dart';

class CartViewModel extends ChangeNotifier {
  int index = 1;
  decreaseIndex() {
    index > 0 ? index-- : index;
    notifyListeners();
  }

  increaseIndex() {
    index = index + 1;
    notifyListeners();
  }

}
