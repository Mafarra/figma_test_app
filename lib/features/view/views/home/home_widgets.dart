// ignore_for_file: must_be_immutable

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_const.dart';
import '../../../../utils/app_media.dart';
import '../../app_widgets/app_widgets.dart';
import '../../app_widgets/home_slider.dart';

Widget buildPanel(BuildContext context) {
  return Directionality(
    textDirection: TextDirection.rtl,
    child: Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: AppColor.greyColor,
      ),
      child: ExpandablePanel(
        header: const ListTile(
          title: Text(
            "أسعار الجملة",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
        ),
        collapsed: const SizedBox(),
        theme: expandedTheme(),
        expanded: EpandedContainer(svgImag: AppMedia.svgImag),
      ),
    ),
  );
}

class EvaluationRow extends StatelessWidget {
  const EvaluationRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          "5 تقييمات ",
          style: TextStyle(
            color: AppColor.headLineColor,
            fontSize: 12,
          ),
          textDirection: TextDirection.rtl,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.end,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          "5.0",
          style: TextStyle(
            color: AppColor.goldColor,
            fontSize: 18,
          ),
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.end,
        ),
        Icon(
          Icons.star_outlined,
          color: AppColor.goldColor,
        ),
      ],
    );
  }
}

class PriceRow extends StatelessWidget {
  const PriceRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          "خصم  20 %",
          style: TextStyle(
            fontSize: 18,
            color: AppColor.greenYelowColor,
            fontWeight: FontWeight.w500,
          ),
          textDirection: TextDirection.rtl,
        ),
        const SizedBox(
          width: 12,
        ),
        Text(
          "25 ر.س",
          style: TextStyle(
            decoration: TextDecoration.lineThrough,
            fontSize: 16,
            color: AppColor.headLineColor,
          ),
          textDirection: TextDirection.rtl,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          "25 ر.س",
          style: TextStyle(
              fontSize: 24,
              color: AppColor.greenColor,
              fontWeight: FontWeight.bold),
          textDirection: TextDirection.rtl,
        ),
      ],
    );
  }
}

class QuantitiyDiscountRow extends StatelessWidget {
  const QuantitiyDiscountRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          'الكمية المتوفرة :10',
          style: TextStyle(color: AppColor.headLineColor, fontSize: 12),
          textDirection: TextDirection.rtl,
        ),
        const SizedBox(
          width: 10,
        ),
        ClipPath(
          clipper: MyClipper(),
          child: Container(
            color: AppColor.greenColor,
            width: 115,
            height: 25,
            child: const Center(
                child: Text(
              'قسيمة خصم 5%',
              style: TextStyle(color: Colors.white, fontSize: 12),
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
            )),
          ),
        ),
      ],
    );
  }
}

class EpandedContainer extends StatelessWidget {
  const EpandedContainer({
    Key? key,
    required this.svgImag,
  }) : super(key: key);

  final SvgPicture svgImag;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const PriceScheduleHeadRow(),
          const SizedBox(
            height: 10,
          ),
          const PriceDetailsRow(),
          CustomDivider(),
          const PriceDetailsRow(),
          CustomDivider(),
          const PriceDetailsRow(),
          CustomDivider(),
          const PriceDetailsRow(),
          CustomDivider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    svgImag,
                    const Text("-1"),
                  ],
                ),
                const Text("10 ر.س"),
                const Text("30%"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PriceScheduleHeadRow extends StatelessWidget {
  const PriceScheduleHeadRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "الكمية/القطعة",
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: AppColor.blackColor),
        ),
        Text("السعر",
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: AppColor.blackColor)),
        Text("الخصم المستحق",
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: AppColor.blackColor)),
      ],
    );
  }
}

class CustomDivider extends StatelessWidget {
  CustomDivider({Key? key, this.lineColor}) : super(key: key);
  Color? lineColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Divider(
      color: lineColor ?? AppColor.darkGreyColor,
      thickness: 1,
    );
  }
}

class CustomDividerWithPadding extends StatelessWidget {
  const CustomDividerWithPadding({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: AppColor.whiteGreyColor,
      thickness: 1,
    );
  }
}

class PriceDetailsRow extends StatelessWidget {
  const PriceDetailsRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text("1-10"),
          Text("10 ر.س"),
          Text("30%"),
        ],
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path_0 = Path();
    path_0.moveTo(0, 0);
    path_0.lineTo(size.width, 0);
    path_0.lineTo(size.width, size.height * 0.2461572);
    path_0.cubicTo(
        size.width * 0.9548609,
        size.height * 0.2461572,
        size.width * 0.9182696,
        size.height * 0.3632520,
        size.width * 0.9182696,
        size.height * 0.5076960);
    path_0.cubicTo(
        size.width * 0.9182696,
        size.height * 0.6521400,
        size.width * 0.9548609,
        size.height * 0.7692360,
        size.width,
        size.height * 0.7692360);
    path_0.lineTo(size.width, size.height);
    path_0.lineTo(0, size.height);
    path_0.lineTo(0, size.height * 0.7692360);
    path_0.cubicTo(
        size.width * 0.04513870,
        size.height * 0.7692360,
        size.width * 0.08173078,
        size.height * 0.6521400,
        size.width * 0.08173078,
        size.height * 0.5076960);
    path_0.cubicTo(
        size.width * 0.08173078,
        size.height * 0.3632520,
        size.width * 0.04513870,
        size.height * 0.2461572,
        0,
        size.height * 0.2461572);
    path_0.lineTo(0, 0);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Color(0xff3AC2CB).withOpacity(1.0);
    return path_0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}

class HomeScreenListTile extends StatefulWidget {
  Function? onTap;
  String? title;
  HomeScreenListTile({Key? key, this.onTap, this.title}) : super(key: key);

  @override
  State<HomeScreenListTile> createState() => _HomeScreenListTileState();
}

class _HomeScreenListTileState extends State<HomeScreenListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        widget.onTap!();
        setState(() {});
      },
      title: Text(
        widget.title ?? "",
        textDirection: TextDirection.rtl,
        style: TextStyle(
            fontSize: 16,
            color: AppColor.darkGreyColor,
            fontWeight: FontWeight.w600),
      ),
      leading: Icon(
        Icons.arrow_back_ios,
        size: 20,
        color: AppColor.darkGreyColor,
      ),
    );
  }
}

ExpandableThemeData expandedTheme() {
  return ExpandableThemeData(
      iconColor: AppColor.darkGreyColor,
      animationDuration: const Duration(milliseconds: 500),
      tapHeaderToExpand: true,
      hasIcon: true,
      expandIcon: Icons.arrow_back_ios_new,
      collapseIcon: Icons.expand_more,
      iconSize: 20,
      bodyAlignment: ExpandablePanelBodyAlignment.center,
      headerAlignment: ExpandablePanelHeaderAlignment.center,
      iconPadding: const EdgeInsets.only(right: 10));
}

class RoundedRectangleWithText extends StatelessWidget {
  Color? color;
  String? text;
  RoundedRectangleWithText({
    Key? key,
    this.text,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return FittedBox(
      child: Container(
        width: screenWidth / 2.5,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          border: Border.all(width: 1.0, color: color!),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: CustomText(
            text: text,
            textColor: color,
            fontSize: 16,
            textDirection: TextDirection.rtl,
          ),
        ),
      ),
    );
  }
}

class ProductSizeColumn extends StatefulWidget {
  bool? isClicked = false;
  ProductSizeColumn({
    Key? key,
    required this.isClicked,
  }) : super(key: key);

  @override
  State<ProductSizeColumn> createState() => _ProductSizeColumnState();
}

class _ProductSizeColumnState extends State<ProductSizeColumn> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomText(
          text: "الحجم",
          textColor: AppColor.blackColor,
          fontSize: 16,
          fontWeight: FontWeight.w700,
          textOverflow: TextOverflow.ellipsis,
          textAlign: TextAlign.end,
        ),
        CustomSizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                widget.isClicked = !widget.isClicked!;
                setState(() {});
              },
              child: RoundedRectangleWithText(
                text: "50 مل (250 SAR)",
                color: widget.isClicked == true
                    ? AppColor.greenColor
                    : AppColor.detailsColor,
              ),
            ),
            CustomSizedBox(width: screenWidth * 0.06),
            InkWell(
              onTap: () {
                widget.isClicked = !widget.isClicked!;
                setState(() {});
              },
              child: RoundedRectangleWithText(
                text: "100 مل (500 SAR)",
                color: widget.isClicked == false
                    ? AppColor.greenColor
                    : AppColor.detailsColor,
              ),
            ),
          ],
        )
      ],
    );
  }
}

class AlsoSoldWithItRow extends StatelessWidget {
  const AlsoSoldWithItRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomIconButton(
              icon: Icons.arrow_forward_ios,
              iconSize: 16,
              iconColor: AppColor.darkGreyColor,
              onTap: () {},
            ),
            CustomIconButton(
              icon: Icons.arrow_back_ios,
              iconSize: 16,
              iconColor: AppColor.darkGreyColor,
              onTap: () {},
            ),
          ],
        ),
        CustomText(
          text: "يباع معها أيضًا",
          fontSize: 16,
          textColor: AppColor.blackColor,
          fontWeight: FontWeight.w600,
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.end,
        ),
      ],
    );
  }
}

class CustomTextButonWithIcon extends StatelessWidget {
  late double? width;
  late IconData? icon;
  late String? text;
  late Color? backGroundColor;
  late Color? iconColor;
  late Color? textColor;
  late bool? isLeftIcon = true;

  CustomTextButonWithIcon(
      {Key? key,
      this.text,
      this.width,
      this.icon,
      this.backGroundColor,
      this.iconColor,
      this.textColor,
      required this.isLeftIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        child: TextButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(backGroundColor),
                padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(horizontal: 10)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(color: AppColor.greenColor)))),
            onPressed: () {},
            child: isLeftIcon!
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        icon!,
                        color: iconColor,
                      ),
                      CustomSizedBox(
                        width: 2,
                      ),
                      CustomText(
                        text: text,
                        textColor: textColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: text,
                        textColor: textColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                      CustomSizedBox(
                        width: 5,
                      ),
                      Icon(
                        icon!,
                        color: iconColor,
                      ),
                    ],
                  )));
  }
}

class RecomendedProducts extends StatelessWidget {
  const RecomendedProducts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: AppConst.screenWidth / 2.5,
          height: AppConst.screenHeight >= 800
              ? AppConst.screenHeight / 3.3
              : AppConst.screenHeight / 2.5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColor.greenColor, width: .5),
          ),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: AppConst.screenWidth / 2.6,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                      fit: BoxFit.cover, image: AssetImage(AppMedia.parfum2)),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              CustomSizedBox(
                height: 7,
              ),
              CustomText(
                text: "عطر رجالي ",
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
              CustomSizedBox(
                height: 10,
              ),
              CustomText(
                text: "2500 ر.س",
                fontSize: 12,
                fontWeight: FontWeight.w600,
                textDirection: TextDirection.rtl,
              ),
              CustomSizedBox(
                height: 6,
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: TextButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(AppColor.whiteColor),
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(horizontal: 10)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(color: AppColor.greenColor)))),
                  onPressed: () {},
                  child: CustomText(
                    text: "إضافة للسلة",
                    textColor: AppColor.greenColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 10,
          right: 10,
          child: CircleAvatar(
            radius: 20,
            backgroundColor: AppColor.whiteColor,
            child: IconButton(
              icon: const Icon(
                Icons.favorite_border,
              ),
              color: AppColor.redColor,
              onPressed: () {},
            ),
          ),
        ),
      ],
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
      height: 190,
      child: Padding(
        padding:
            const EdgeInsets.only(right: 20, top: 20, left: 12, bottom: 10),
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
                        icon: Icon(
                          Icons.arrow_circle_left_outlined,
                          color: AppColor.blackColor,
                        )),
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
                            image: AssetImage(AppMedia.channel),
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
            CustomSizedBox(
              height: 5,
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

displayDetailsBottomSheet(BuildContext context) {
  return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(20),
          height: AppConst.screenHeight >= 800
              ? AppConst.screenHeight / 1.5
              : AppConst.screenHeight / 1.2,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0),
              topRight: Radius.circular(40.0),
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(),
                  CustomText(
                    text: 'التفاصيل',
                    textColor: AppColor.blackColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  CustomIconButton(
                    icon: Icons.close,
                    iconColor: AppColor.blackColor,
                    iconSize: 22,
                    onTap: () => Navigator.pop(context),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  children: <Widget>[
                    const SizedBox(
                      height: 40,
                    ),
                    CustomText(
                      text:
                          '''Lorem ipsum dolor sit amet, consectetur adipiscing elit. Eu in at sit sed tristique. Massa cursus pellentesque laoreet dignissim lacus etiam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. mauris.''',
                      textAlign: TextAlign.right,
                      fontSize: 16,
                      textColor: AppColor.detailsColor,
                    ),
                    const PageViewContainer(
                      index: 1,
                    ),
                    const PageViewContainer(
                      index: 1,
                    ),
                    const PageViewContainer(
                      index: 1,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      });
}

displayProparatiesBottomSheet(BuildContext context) {
  return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(30),
          height: AppConst.screenHeight / 1.3,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0),
              topRight: Radius.circular(40.0),
            ),
          ),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(),
                  CustomText(
                    text: 'الخصائص',
                    textColor: AppColor.blackColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  CustomIconButton(
                    icon: Icons.close,
                    iconColor: AppColor.blackColor,
                    iconSize: 22,
                    onTap: () => Navigator.pop(context),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return _buildProparatiesContainer(index);
                  },
                  itemCount: 10,
                ),
              ),
            ],
          ),
        );
      });
}

_buildProparatiesContainer(int index) {
  return Container(
    width: double.infinity,
    height: 50,
    padding: const EdgeInsets.symmetric(horizontal: 10),
    color: index.isEven ? AppColor.whiteBlueColor : AppColor.whiteColor,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          text: "White Musk, Cashmeran, Cedar",
          fontSize: 14,
          fontWeight: FontWeight.w400,
          textColor: AppColor.darkGreyColor,
        ),
        CustomText(
          text: "نفحات قاعدية",
          fontSize: 14,
          fontWeight: FontWeight.w400,
          textColor: AppColor.darkGreyColor,
        ),
      ],
    ),
  );
}

displayEvaluationBottomSheet(BuildContext context) {
  return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(30),
          height: AppConst.screenHeight / 1.2,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0),
              topRight: Radius.circular(40.0),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      displayAddNewRateBottomShete(context);
                    },
                    child: CustomText(
                      text: 'إضافة تقييم',
                      textColor: AppColor.greenColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  CustomText(
                    text: 'التقييمات',
                    textColor: AppColor.blackColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  CustomIconButton(
                    icon: Icons.close,
                    iconColor: AppColor.blackColor,
                    iconSize: 22,
                    onTap: () => Navigator.pop(context),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  children: <Widget>[
                    CustomBackGroundContainer(
                      height: 140,
                      child: FittedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            SizedBox(
                              width: 23,
                            ),
                            FittedBox(child: LeftRatingColumn()),
                            SizedBox(
                              width: 30,
                            ),
                            FittedBox(child: RightRatingColumn()),
                            SizedBox(
                              width: 23,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomRatingBarStars(
                      initRating: 5,
                      itemSize: 10,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomDetailsText(
                      fontSize: 14,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        RartingPicContainer(),
                        RartingPicContainer(),
                        RartingPicContainer(),
                      ],
                    ),
                    const UserCommentInfoRow(),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomDivider(
                      lineColor: AppColor.whiteGreyColor,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomRatingBarStars(
                      initRating: 5,
                      itemSize: 10,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomDetailsText(
                      fontSize: 14,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const UserCommentInfoRow(),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomText(
                          text: "متجر شانيل",
                          textColor: AppColor.blackColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                        CustomSizedBox(
                          width: 8,
                        ),
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            image: const DecorationImage(
                                image: AssetImage(AppMedia.crown),
                                fit: BoxFit.contain,
                                scale: 1),
                          ),
                        ),
                        CustomSizedBox(
                          width: 30,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 50.0, top: 10),
                      child: CustomDetailsText(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      });
}

displayAddNewRateBottomShete(BuildContext context) {
  return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(30),
          height: AppConst.screenHeight >= 800
              ? AppConst.screenHeight / 1.3
              : AppConst.screenHeight / 1.2,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0),
              topRight: Radius.circular(40.0),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(),
                  CustomText(
                    text: 'إضافة تقييم',
                    textColor: AppColor.blackColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  CustomIconButton(
                    icon: Icons.close,
                    iconColor: AppColor.blackColor,
                    iconSize: 22,
                    onTap: () => Navigator.pop(context),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomRatingBarStars(
                          initRating: 0,
                          itemSize: 30,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        CustomText(
                          text: "تقييمك",
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          textColor: AppColor.headLineColor,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextField(
                      maxLines: 10,
                      minLines: 8,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide:
                                  BorderSide(color: AppColor.whiteGreyColor))),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomText(
                      text: "إضافة صورة",
                      textColor: AppColor.headLineColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      textDirection: TextDirection.rtl,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                            margin: const EdgeInsets.only(
                                left: 10, top: 10, bottom: 10),
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              color: AppColor.whiteGreyColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.add_photo_alternate_outlined,
                                color: Colors.white,
                              ),
                            )),
                        RartingPicContainer(
                          width: 80,
                          height: 80,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomText(
                          text: "هل تريد إخفاء هويتك",
                          textColor: AppColor.detailsColor,
                          fontSize: 14,
                        ),
                        Checkbox(
                          visualDensity:
                              const VisualDensity(horizontal: -4, vertical: -4),
                          value: true,
                          onChanged: (value) {},
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          checkColor: AppColor.whiteColor,
                          activeColor: AppColor.greenColor,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      width: AppConst.screenWidth / 1.2,
                      height: 50,
                      child: TextButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  AppColor.greenColor),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      side: BorderSide(
                                          color: AppColor.greenColor)))),
                          onPressed: () {},
                          child: CustomText(
                            text: "إرسال تعليق",
                            textColor: AppColor.whiteColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      });
}

class UserCommentInfoRow extends StatelessWidget {
  const UserCommentInfoRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CustomText(
          text: "4, أبريل , 2022",
          fontSize: 10,
          textColor: AppColor.detailsColor,
          fontWeight: FontWeight.w500,
          textDirection: TextDirection.rtl,
        ),
        CustomSizedBox(
          width: 5,
        ),
        CustomText(
          text: "أحمد ",
          fontSize: 16,
          textColor: AppColor.blackColor,
          fontWeight: FontWeight.w500,
        ),
        CustomSizedBox(
          width: 5,
        ),
        const CircleAvatar(
          radius: 15,
          foregroundImage: AssetImage(AppMedia.parfum3),
        ),
      ],
    );
  }
}

class RartingPicContainer extends StatelessWidget {
  late double? width;
  late double? height;
  RartingPicContainer({Key? key, this.width, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
      width: width ?? 40,
      height: height ?? 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Image.asset(
        AppConst.imageAsset[3],
        fit: BoxFit.cover,
      ),
    );
  }
}

class RightRatingColumn extends StatelessWidget {
  const RightRatingColumn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomText(
          text: "4.0",
          fontSize: 24,
          textColor: AppColor.darkGreyColor,
          fontWeight: FontWeight.w500,
        ),
        CustomRatingBarStars(
          itemSize: 25,
          initRating: 4,
        ),
        CustomText(
          text: "5 تقييمات",
          fontSize: 16,
          textColor: AppColor.detailsColor,
          fontWeight: FontWeight.w400,
          textDirection: TextDirection.rtl,
        ),
      ],
    );
  }
}

class LeftRatingColumn extends StatelessWidget {
  const LeftRatingColumn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        RatingRow(),
        SizedBox(
          height: 5,
        ),
        RatingRow(),
        SizedBox(
          height: 5,
        ),
        RatingRow(),
        SizedBox(
          height: 5,
        ),
        RatingRow(),
        SizedBox(
          height: 5,
        ),
        RatingRow(),
      ],
    );
  }
}

class CustomRatingBarStars extends StatelessWidget {
  double itemSize;
  double initRating;
  CustomRatingBarStars({
    required this.itemSize,
    required this.initRating,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RatingBar(
        wrapAlignment: WrapAlignment.start,
        allowHalfRating: false,
        ignoreGestures: true,
        itemSize: itemSize,
        textDirection: TextDirection.rtl,
        minRating: 1,
        maxRating: 5,
        initialRating: initRating,
        ratingWidget: RatingWidget(
          full: Icon(
            Icons.star_rounded,
            color: AppColor.goldColor,
          ),
          half: Icon(
            Icons.star_half,
            color: AppColor.goldColor,
          ),
          empty: Icon(
            Icons.star_border_rounded,
            color: AppColor.goldColor,
          ),
        ),
        onRatingUpdate: (rate) {});
  }
}

class RatingRow extends StatelessWidget {
  const RatingRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomText(
          text: "12",
          textColor: AppColor.detailsColor,
          fontSize: 10,
        ),
        const SizedBox(
          width: 5,
        ),
        Directionality(
          textDirection: TextDirection.rtl,
          child: SizedBox(
            width: 60,
            child: LinearProgressIndicator(
              backgroundColor: AppColor.progressBackGround,
              color: AppColor.whiteblackColor,
              minHeight: 5,
              value: 0.5,
              // valueColor: ,
            ),
          ),
        ),
        const SizedBox(width: 5),
        CustomRatingBarStars(
          itemSize: 10,
          initRating: 5,
        ),
      ],
    );
  }
}

class CustomDetailsText extends StatelessWidget {
  double? fontSize;
  CustomDetailsText({
    Key? key,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Lorem ipsum dolor sit amet, ipiscingisl amet orci ipsum dis lectus hac mauris.",
      style: TextStyle(color: AppColor.headLineColor, fontSize: fontSize ?? 16),
      textAlign: TextAlign.end,
    );
  }
}
