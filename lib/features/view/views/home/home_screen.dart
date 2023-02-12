// ignore_for_file: must_be_immutable
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../utils/app_colors.dart';
import '../../app_widgets/home_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var svgImag = SvgPicture.string('''
<svg width="20" height="9" viewBox="0 0 20 9" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M15.4056 0.244751C14.2585 0.244751 13.1751 0.688097 12.3984 1.45997L10.148 3.43913L10.144 3.43516L8.93716 4.49203L8.94511 4.49993L6.79829 6.39203C6.28848 6.89475 5.61138 7.17185 4.89045 7.17185C3.40082 7.17185 2.18998 5.97247 2.18998 4.49997C2.18998 3.02747 3.40082 1.8281 4.89045 1.8281C5.61138 1.8281 6.28848 2.10519 6.83414 2.6435L7.73827 3.43913L8.94112 2.38225L7.93341 1.4956C7.12088 0.692067 6.04147 0.248722 4.89041 0.248722C2.5166 0.244751 0.588814 2.15269 0.588814 4.49997C0.588814 6.84725 2.5166 8.75519 4.89045 8.75519C6.03755 8.75519 7.11696 8.31185 7.8976 7.54394L10.148 5.56082L10.152 5.56479L11.3549 4.50394L11.3509 4.49997L13.4977 2.61185C14.0075 2.10519 14.6846 1.8281 15.4056 1.8281C16.8952 1.8281 18.106 3.02747 18.106 4.49997C18.106 5.97247 16.8952 7.17185 15.4056 7.17185C14.6846 7.17185 14.0075 6.89475 13.4619 6.36038L12.5577 5.56475L11.3549 6.6256L12.3626 7.51225C13.1751 8.31578 14.2545 8.75515 15.4016 8.75515C17.7794 8.75519 19.7072 6.84725 19.7072 4.49997C19.7072 2.15269 17.7794 0.244751 15.4056 0.244751Z" fill="#5F5F5F"/>
</svg>
''');

  PreferredSizeWidget simpleAppBar = AppBar(
    elevation: 0,
    centerTitle: true,
    backgroundColor: AppColor.whiteColor,
    title: Text(
      'عطور وتجميل',
      style: TextStyle(
          color: AppColor.blackColor,
          fontSize: 18,
          fontWeight: FontWeight.w500),
    ),
    actions: [
      IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_forward,
            color: AppColor.blackColor,
            size: 16,
          )),
    ],
  );
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: simpleAppBar,
      body: Padding(
        padding: const EdgeInsets.only(
          right: 26,
          top: 10,
        ),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            CustomSizedBox(height: 20,),
            const TopTitleRow(),
            const HomeSlider(),
            CustomSizedBox(height: 10,),
            const EvaluationRow(),
            CustomSizedBox(height: 10,),
            const PriceRow(),
            CustomSizedBox(height: 15,),
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
            CustomSizedBox(height: 15,),
            _buildPanel(context),
          ],
        ),
      ),
    );
  }

  Widget _buildPanel(BuildContext context) {
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
            header: ListTile(
              tileColor: AppColor.greyColor,
              title: const Text(
                "أسعار الجملة",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
              ),
            ),
            collapsed: const SizedBox(),
            theme: expandedTheme(),
            expanded: EpandedContainer(svgImag: svgImag),
          ),
        ),
      ),
    );
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
    );
  }
}
class CustomSizedBox extends StatelessWidget {
  double? height = 0;
  double? width = 0;
  CustomSizedBox({
    Key? key,
    @required this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
    );
  }
}
class TopTitleRow extends StatelessWidget {
  const TopTitleRow({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          child: Text(
            "عطر شانيل 5 مل",
            style: TextStyle(
                color: AppColor.headLineColor,
                fontSize: 18,
                fontWeight: FontWeight.w700),
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }
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
