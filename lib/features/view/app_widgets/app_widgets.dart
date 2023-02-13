// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import '../../../utils/app_colors.dart';

class CustomSizedBox extends StatelessWidget {
  double? height = 0;
  double? width = 0;
  CustomSizedBox({
    Key? key,
    this.height,
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

PreferredSizeWidget simpleAppBar({String? title, Function? onTap}) {
  return AppBar(
    elevation: 0,
    centerTitle: true,
    backgroundColor: AppColor.whiteColor,
    title: Text(
      title!,
      style: TextStyle(
          color: AppColor.blackColor,
          fontSize: 18,
          fontWeight: FontWeight.w500),
    ),
    actions: [
      IconButton(
          onPressed: () => onTap,
          icon: Icon(
            Icons.arrow_forward,
            color: AppColor.blackColor,
            size: 16,
          )),
    ],
  );
}

class CustomText extends StatelessWidget {
  String? text = "";
  double? fontSize = 14;
  Color? textColor;
  FontWeight? fontWeight = FontWeight.normal;
  TextOverflow? textOverflow = TextOverflow.ellipsis;
  TextAlign? textAlign = TextAlign.end;
  TextDirection? textDirection;
  CustomText(
      {Key? key,
      this.text,
      this.textColor,
      this.fontSize,
      this.fontWeight,
      this.textAlign,
      this.textOverflow,
      this.textDirection})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(
          color: textColor, fontSize: fontSize, fontWeight: fontWeight),
      overflow: textOverflow,
      textAlign: textAlign,
      textDirection: textDirection ?? TextDirection.ltr,
    );
  }
}
