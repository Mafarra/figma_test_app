import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import '../../../../utils/app_colors.dart';
import '../../app_widgets/home_slider.dart';
import 'dart:math' as math;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
  Row topTitleRow = Row(
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
  Row evaluationRow = Row(
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
  Row priceRow = Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Container(
        child: Text(
          "خصم  20 %",
          style: TextStyle(
              fontSize: 18,
              color: AppColor.greenYelowColor,
              fontWeight: FontWeight.bold),
          textDirection: TextDirection.rtl,
        ),
      ),
      const SizedBox(
        width: 12,
      ),
      Container(
        child: Text(
          "25 ر.س",
          style: TextStyle(
            decoration: TextDecoration.lineThrough,
            fontSize: 16,
            color: AppColor.headLineColor,
          ),
          textDirection: TextDirection.rtl,
        ),
      ),
      const SizedBox(
        width: 10,
      ),
      Container(
        child: Text(
          "25 ر.س",
          style: TextStyle(
              fontSize: 24,
              color: AppColor.greenColor,
              fontWeight: FontWeight.bold),
          textDirection: TextDirection.rtl,
        ),
      ),
    ],
  );
  Row quantitiyDiscountRow = Row(
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
            const SizedBox(
              height: 20,
            ),
            topTitleRow,
            const HomeSlider(),
            const SizedBox(
              height: 10,
            ),
            evaluationRow,
            const SizedBox(
              height: 10,
            ),
            priceRow,
            const SizedBox(
              height: 15,
            ),
            quantitiyDiscountRow,
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(left: 26, top: 20),
              child: Text(
                "Lorem ipsum dolor sit amet, ipiscingisl amet orci ipsum dis lectus hac mauris.",
                style: TextStyle(color: AppColor.headLineColor, fontSize: 16),
                textAlign: TextAlign.end,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 26),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: _buildPanel(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPanel(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: AppColor.greyColor,
      ),
      child: ExpandablePanel(
        header: ListTile(
          tileColor: AppColor.greyColor,
          title: const Text("أسعار الجملة"),
        ),
        collapsed: const SizedBox(),
        theme: ExpandableThemeData(
          iconColor: AppColor.darkGreyColor,
          animationDuration: const Duration(milliseconds: 500),
          tapHeaderToExpand: true,
          hasIcon: true,
          expandIcon: Icons.arrow_back_ios_new,
          collapseIcon: Icons.expand_more,
          iconSize: 20,
          bodyAlignment:ExpandablePanelBodyAlignment.center,
          headerAlignment: ExpandablePanelHeaderAlignment.center,
        ),
        expanded: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("1"),
                Text("2"),
                Text("2"),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("1"),
                Text("2"),
                Text("2"),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("1"),
                Text("2"),
                Text("2"),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("1"),
                Text("2"),
                Text("2"),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("1"),
                Text("2"),
                Text("2"),
              ],
            ),
          ],
        ),
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
