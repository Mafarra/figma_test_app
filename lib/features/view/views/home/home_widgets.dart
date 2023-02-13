// ignore_for_file: must_be_immutable

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_media.dart';
import '../../app_widgets/app_widgets.dart';

Widget buildPanel(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(left: 26),
    child: Directionality(
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
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
            ),
          ),
          collapsed: const SizedBox(),
          theme: expandedTheme(),
          expanded: EpandedContainer(svgImag: AppMedia.svgImag),
        ),
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
        Container(
          child: Text(
            "5 تقييمات ",
            style: TextStyle(
              color: AppColor.headLineColor,
              fontSize: 18,
            ),
            textDirection: TextDirection.rtl,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.end,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Container(
          child: Text(
            "5.0",
            style: TextStyle(
              color: AppColor.goldColor,
              fontSize: 18,
            ),
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.end,
          ),
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
              fontWeight: FontWeight.bold),
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
    return Padding(
      padding: const EdgeInsets.only(left: 26.0),
      child: Divider(
        color: AppColor.whiteGreyColor,
        thickness: 1,
      ),
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
      contentPadding: const EdgeInsets.only(
        left: 40,
      ),
      onTap: () => onTap,
      title: Text(
        title ?? "",
        textDirection: TextDirection.rtl,
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


class ProductSizeColumn extends StatelessWidget {
  const ProductSizeColumn({
    Key? key,
  }) : super(key: key);
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
        Padding(
          padding: const EdgeInsets.only(left: 26),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RoundedRectangleWithText(text: "50 مل (250 SAR)",color: AppColor.greenColor,),
              CustomSizedBox(width: screenWidth*0.06),
              RoundedRectangleWithText(text: "100 مل (500 SAR)",color: AppColor.detailsColor,),
            ],
          ),
        )
      ],
    );
  }
}

