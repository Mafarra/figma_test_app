// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import '../../../../utils/app_colors.dart';
import '../../app_widgets/app_widgets.dart';
import '../../app_widgets/home_slider.dart';
import 'home_widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: simpleAppBar(title: 'عطور وتجميل'),
      body: Padding(
        padding: const EdgeInsets.only(
          right: 26,
          top: 10,
        ),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            CustomSizedBox(
              height: 20,
            ),
            CustomText(
              text: "عطر شانيل 5 مل",
              textColor: AppColor.headLineColor,
              fontSize: 18,
              fontWeight: FontWeight.w700,
              textOverflow: TextOverflow.ellipsis,
              textAlign: TextAlign.end,
            ),
            const HomeSlider(),
            CustomSizedBox(
              height: 10,
            ),
            const EvaluationRow(),
            CustomSizedBox(
              height: 10,
            ),
            const PriceRow(),
            CustomSizedBox(
              height: 15,
            ),
            const QuantitiyDiscountRow(),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(left: 26, top: 20),
              child: Text(
                "Lorem ipsum dolor sit amet, ipiscingisl amet orci ipsum dis lectus hac mauris.",
                style: TextStyle(color: AppColor.headLineColor, fontSize: 16),
                textAlign: TextAlign.end,
              ),
            ),
            CustomSizedBox(
              height: 15,
            ),
            buildPanel(context),
            CustomSizedBox(height: 25),
            HomeScreenListTile(
              title: "التفاصيل",
            ),
            const CustomDividerWithPadding(),
            HomeScreenListTile(
              title: "الخصائص",
            ),
            const CustomDividerWithPadding(),
            HomeScreenListTile(
              title: "التقييمات",
            ),
            const ProductSizeColumn(),
            
          ],
        ),
      ),
    );
  }
}
