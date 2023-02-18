// ignore_for_file: must_be_immutable
import 'package:figma_test_app/features/model/product_model.dart';
import 'package:figma_test_app/utils/app_const.dart';
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
  bool? isChecked = true;
  bool? isClicked = false;
  ScrollController? scrollController;
  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    AppConst.screenWidth = MediaQuery.of(context).size.width;
    AppConst.screenHeight = MediaQuery.of(context).size.height;
    int? index = 1;
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
            ProductSizeColumn(
              isClicked: isClicked,
            ),
            CustomSizedBox(
              height: 25,
            ),
            const AlsoSoldWithItRow(),
            CustomSizedBox(
              height: 26,
            ),
            _soldWithListView(),
            CustomSizedBox(
              height: 20,
            ),
            const StoreAdvertCard(),
            CustomSizedBox(
              height: 20,
            ),
            CustomText(
              text: "منتجات موصى بها من المتجر",
              fontSize: 16,
              fontWeight: FontWeight.w600,
              textDirection: TextDirection.rtl,
            ),
            CustomSizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                RecomendedProducts(),
                RecomendedProducts(),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionCart(index: index),
    );
  }

  Container _soldWithListView() {
    return Container(
      width: AppConst.screenWidth / 2,
      height: AppConst.screenHeight * 0.32,
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 28),
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
          _buildSelectAllButton(),
        ],
      ),
    );
  }

  Widget _buildListView() {
    return SizedBox(
      width: double.infinity,
      height: 160,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Row(
            children: [
              CustomSizedBox(
                width: 20,
              ),
              _buildListViewItem(
                  context: context,
                  productModel: AppConst.productsItems[index]),
            ],
          );
        },
        itemCount: AppConst.productsItems.length,
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

  Widget _buildSelectAllButton() {
    List<ProductModel>? productsList = AppConst.productsItems;
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
            productsList[0].isChecked == true
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

class FloatingActionCart extends StatelessWidget {
  const FloatingActionCart({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int? index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            width: 1,
          ),
          Container(
              padding: const EdgeInsets.all(1),
              width: AppConst.screenWidth / 3.5,
              height: 55,
              decoration: BoxDecoration(
                color: AppColor.whiteColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.add_circle_outline,
                        color: AppColor.blackColor,
                      )),
                  CustomText(
                    text: "$index",
                    textAlign: TextAlign.center,
                    textColor: AppColor.blackColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.remove_circle_outline,
                        color: AppColor.blackColor,
                      )),
                ],
              )),
          SizedBox(
            width: AppConst.screenWidth / 1.7,
            height: 55,
            child: TextButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(AppColor.greenColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: BorderSide(color: AppColor.greenColor)))),
                onPressed: () {},
                child: CustomText(
                  text: "إضافة للسلة",
                  textColor: AppColor.whiteColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                )),
          ),
        ],
      ),
    );
  }
}
