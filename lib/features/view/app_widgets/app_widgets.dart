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
          fontWeight: FontWeight.w600),
    ),
    actions: [
      CustomIconButton(
        icon: Icons.arrow_back,
        iconColor: AppColor.blackColor,
        iconSize: 22,
        iconPadding: 20,
      ),
    ],
  );
}

class CustomIconButton extends StatelessWidget {
  Function? onTap;
  IconData? icon;
  Color? iconColor;
  double? iconSize;
  double? iconPadding;
  CustomIconButton(
      {Key? key,
      this.onTap,
      this.icon,
      this.iconColor,
      this.iconSize,
      this.iconPadding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        padding: EdgeInsets.all(iconPadding ?? 0),
        onPressed: () => onTap,
        icon: Icon(icon!,
            color: iconColor, size: iconSize, textDirection: TextDirection.rtl),
        splashRadius: 15,
        iconSize: 20,
        splashColor: AppColor.greenColor.withOpacity(0.5),
        alignment: Alignment.center,
        constraints: const BoxConstraints(minWidth: 10));
  }
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
      this.text = "",
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
      text ?? "",
      style: TextStyle(
          color: textColor, fontSize: fontSize, fontWeight: fontWeight),
      overflow: textOverflow ?? TextOverflow.ellipsis,
      textAlign: textAlign,
      textDirection: textDirection ?? TextDirection.ltr,
    );
  }
}

class CustomBackGroundContainer extends StatelessWidget {
  late double? height;
  late Widget? child;
  CustomBackGroundContainer({
    Key? key,this.height,this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColor.greyColor,
      ),
      child: child,
    );
  }
}
