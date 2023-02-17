// ignore_for_file: must_be_immutable
import 'package:figma_test_app/features/model/product_model.dart';
import 'package:figma_test_app/utils/app_const.dart';
import 'package:figma_test_app/utils/app_media.dart';
import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
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
  ScrollController? scrollController;
  AutoScrollController? controller;
  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    controller = AutoScrollController(
        viewportBoundaryGetter: () =>
            Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
        axis: Axis.horizontal);
  }

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
              controller: controller!,
            ),
            CustomSizedBox(
              height: 26,
            ),
            _soldWithListView(),
            CustomSizedBox(
              height: 20,
            ),
            const StoreAdvertCard(),
            

          ],
        ),
      ),
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
        controller: controller,
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

class StoreAdvertCard extends StatelessWidget {
  const StoreAdvertCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomBackGroundContainer(
      height: 170,
      child: Padding(
        padding: const EdgeInsets.only(
            right: 20, top: 20, left: 12, bottom: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                            Icons.arrow_circle_left_outlined)),
                    CustomSizedBox(
                      width: 15,
                    ),
                    ImageIcon(
                      const AssetImage(AppMedia.comment),
                      size: 20,
                      color: AppColor.greenColor,
                    ),
                  ],
                ),
                Row(
                  children: [
                    CustomText(
                      text: "متجر شانيل",
                      textColor: AppColor.blackColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                    CustomSizedBox(
                      width: 8,
                    ),
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                            image: AssetImage(AppMedia.crown),
                            fit: BoxFit.contain,
                            scale: 1),
                      ),
                    ),
                    CustomSizedBox(
                      width: 8,
                    ),
                    Container(
                      width: 30,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                            image: NetworkImage(AppMedia.channelUrl),
                            fit: BoxFit.contain,
                            scale: 1),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            CustomText(
              text: "متجر عطور وتجميل",
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomText(
                  text: "الدمام",
                  textDirection: TextDirection.rtl,
                ),
                CustomSizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.place_outlined,
                  color: AppColor.greenColor,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomTextButonWithIcon(
                  isLeftIcon: false,
                  width: AppConst.screenWidth / 3.5,
                  backGroundColor: AppColor.whiteColor,
                  text: "متابعة",
                  icon: Icons.person_add_alt,
                  textColor: AppColor.greenColor,
                  iconColor: AppColor.greenColor,
                ),
                CustomSizedBox(
                  width: 10,
                ),
                CustomTextButonWithIcon(
                  isLeftIcon: true,
                  width: AppConst.screenWidth / 3.5,
                  backGroundColor: AppColor.greenColor,
                  text: "زيارة المتجر",
                  icon: Icons.arrow_back,
                  textColor: AppColor.whiteColor,
                  iconColor: AppColor.whiteColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
