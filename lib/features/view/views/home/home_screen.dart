// ignore_for_file: must_be_immutable
import 'package:figma_test_app/features/model/product_model.dart';
import 'package:figma_test_app/utils/app_const.dart';
import 'package:figma_test_app/utils/app_media.dart';
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

List<ProductModel> productsItems = [
  ProductModel(
    isChecked: false,
    img: AppMedia.parfum1,
    productName: "علب تعبئة",
    productPrice: "10 ر.س",
  ),
  ProductModel(
    isChecked: true,
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
];
ScrollController? scrollController;
@override
void initState() {
  scrollController = ScrollController();
}

class _HomeScreenState extends State<HomeScreen> {
  bool? isChecked = true;

  @override
  Widget build(BuildContext context) {
    AppConst.screenWidth = MediaQuery.of(context).size.width;
    AppConst.screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: simpleAppBar(title: 'عطور وتجميل'),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 26, vertical: 10),
        width: double.infinity,
        child: ListView(
          shrinkWrap: true,
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
              padding: const EdgeInsets.only(top: 20),
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
            CustomSizedBox(
              height: 25,
            ),
            AlsoSoldWithItRow(
              leftTap: _leftTapFunction,
              rightTap: _rightTapFunction,
            ),
            CustomSizedBox(
              height: 26,
            ),
            Container(
              width: AppConst.screenWidth / 2,
              height: AppConst.screenHeight * 0.32,
              padding: const EdgeInsets.only(
                  top: 20, left: 20, right: 20, bottom: 28),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                color: AppColor.greyColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildListView(),
                  CustomSizedBox(
                    height: 10,
                  ),
                  _buildSelectAllButton(productsList: productsItems),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _leftTapFunction({ScrollController? controller}) {
    double index = 1;
    setState(() {
      return scrollController!.jumpTo(index++);
    });
  }

  void _rightTapFunction({ScrollController? controller}) {
    double index =  1;
    setState(() {
      return scrollController!.jumpTo(index--);
    });
  }

  Widget _buildListView() {
    return SizedBox(
      width: double.infinity,
      height: 160,
      child: ListView.builder(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        shrinkWrap: false,
        itemBuilder: (context, index) {
          return Row(
            children: [
              CustomSizedBox(
                width: 20,
              ),
              _buildListViewItem(
                  context: context, productModel: productsItems[index]),
            ],
          );
        },
        itemCount: productsItems.length,
      ),
    );
  }

  Widget _buildListViewItem(
      {BuildContext? context, ProductModel? productModel}) {
    return Container(
      width: AppConst.screenWidth * 0.27,
      height: AppConst.screenHeight * 0.17,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColor.greenColor, width: 1),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Theme(
                data: ThemeData(unselectedWidgetColor: AppColor.whiteGreyColor),
                child: Checkbox(
                  tristate: false,
                  visualDensity:
                      const VisualDensity(horizontal: -4, vertical: -4),
                  value: productModel?.isChecked ?? false,
                  onChanged: (bool? newValue) {
                    setState(() {
                      productModel!.isChecked = newValue!;
                    });
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  checkColor: AppColor.whiteColor,
                  activeColor: AppColor.greenColor,
                ),
              ),
            ],
          ),
          Container(
            width: 61,
            height: 69,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    productModel?.img! ?? "",
                  )),
            ),
          ),
          const Spacer(),
          CustomText(
            text: productModel?.productName ?? "",
            textColor: AppColor.blackColor,
            fontSize: 12,
            fontWeight: FontWeight.w500,
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.center,
          ),
          CustomSizedBox(
            height: 1,
          ),
          CustomText(
            text: productModel?.productPrice ?? "",
            textColor: AppColor.blackColor,
            fontSize: 12,
            fontWeight: FontWeight.w500,
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.center,
          ),
          CustomSizedBox(
            height: 1,
          ),
        ],
      ),
    );
  }

  Widget _buildSelectAllButton({List<ProductModel>? productsList}) {
    return SizedBox(
      width: AppConst.screenWidth * 0.8,
      child: TextButton(
          style: ButtonStyle(
              padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(horizontal: 10)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(color: AppColor.greenColor)))),
          onPressed: () {
            productsList![0].isChecked == true
                ? productsList.forEach((element) {
                    element.isChecked = false;
                  })
                : productsList.forEach((element) {
                    element.isChecked = true;
                  });
            setState(() {});
          },
          child: CustomText(
            text: "تحديد الكل",
            textColor: AppColor.greenColor,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          )),
    );
  }
}
