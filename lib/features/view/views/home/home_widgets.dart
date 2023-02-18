// ignore_for_file: must_be_immutable

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_const.dart';
import '../../../../utils/app_media.dart';
import '../../app_widgets/app_widgets.dart';

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
          const CustomDivider(),
          const PriceDetailsRow(),
          const CustomDivider(),
          const PriceDetailsRow(),
          const CustomDivider(),
          const PriceDetailsRow(),
          const CustomDivider(),
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
  const CustomDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: AppColor.darkGreyColor,
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

class HomeScreenListTile extends StatelessWidget {
  Function? onTap;
  String? title;
  HomeScreenListTile({Key? key, this.onTap, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => onTap,
      title: Text(
        title ?? "",
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
    return Container(
      width: (screenWidth / 2.5),
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
    );
  }
}

class ProductSizeColumn extends StatefulWidget {
  bool? isClicked = false;
   ProductSizeColumn({
    Key? key,required this.isClicked,
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
              onTap: (){ 
                widget.isClicked = !widget.isClicked!;
                setState(() {
                  
                });
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
                setState(() {
                  
                });
              },
              child: RoundedRectangleWithText(
                text: "100 مل (500 SAR)",
                color: widget.isClicked == false
                    ? AppColor. greenColor
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
              onTap: (){},
            ),
            CustomIconButton(
              icon: Icons.arrow_back_ios,
              iconSize: 16,
              iconColor: AppColor.darkGreyColor,
              onTap: (){},
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
                      CustomSizedBox(width: 2,),
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
                      CustomSizedBox(width: 5,),
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
          height: AppConst.screenHeight * 0.31,
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
