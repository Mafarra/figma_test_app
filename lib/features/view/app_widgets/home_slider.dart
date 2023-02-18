import 'package:figma_test_app/utils/app_colors.dart';
import 'package:figma_test_app/utils/app_const.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeSlider extends StatefulWidget {
  final List<String> imageAsset = AppConst.imageAsset;

  const HomeSlider({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _HomeSliderState createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  Icon selectedlikeIcon = Icon(
    Icons.favorite,
    color: AppColor.redColor,
    size: 22,
  );
  Icon disabledlikeIcon = Icon(
    Icons.favorite_border,
    color: AppColor.redColor,
    size: 22,
  );
  Icon shareIcon = Icon(
    Icons.share_outlined,
    color: AppColor.blackColor,
  );
  Icon repeatIcon = Icon(
    Icons.repeat,
    color: AppColor.goldColor,
  );

  bool isSelected = false;
  double screenWidth = AppConst.screenWidth;
  double screenPad = 16.0; //
  PageController? _pageController;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(
        viewportFraction: 1 + (screenPad * 2 / screenWidth),
        keepPage: true,
        initialPage: 0);
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 310,
      child: Stack(
        children: <Widget>[
          PageView.builder(
            physics: const BouncingScrollPhysics(),
            controller: _pageController,
            scrollDirection: Axis.horizontal,
            itemCount: widget.imageAsset.length,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  PageViewContainer(
                    widget: widget,
                    index: index,
                  ),
                  _posittiondIcons(),
                ],
              );
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
              ),
              child: SmoothPageIndicator(
                controller: _pageController!,
                count: widget.imageAsset.length,
                onDotClicked: (index) {
                  _pageController!.jumpToPage(index);
                  setState(() {});
                },
                effect: ExpandingDotsEffect(
                  expansionFactor: 1.5,
                  radius: 10,
                  spacing: 8,
                  dotHeight: 5,
                  dotWidth: 15,
                  dotColor: AppColor.greenColor.withOpacity(.4),
                  activeDotColor: AppColor.greenColor,
                  offset: 0.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  Positioned _posittiondIcons() {
    return Positioned(
      top: 70.07,
      left: 28.33,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            backgroundColor: AppColor.whiteColor,
            radius: 18,
            child: IconButton(
              padding: const EdgeInsets.all(0.1),
              icon: isSelected ? selectedlikeIcon : disabledlikeIcon,
              onPressed: () {
                setState(() {
                  isSelected = !isSelected;
                });
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          customCircleAvatarWithIcon(icon: repeatIcon, raduis: 19),
          const SizedBox(
            height: 20,
          ),
          customCircleAvatarWithIcon(icon: shareIcon, raduis: 19),
        ],
      ),
    );
  }

  CircleAvatar customCircleAvatarWithIcon(
      {double? raduis, Color? iconColor, Icon? icon}) {
    return CircleAvatar(
      backgroundColor: AppColor.whiteColor,
      radius: raduis,
      child: IconButton(
        iconSize: 18,
        padding: const EdgeInsets.all(0.1),
        icon: icon!,
        onPressed: () {},
      ),
    );
  }
}

class PageViewContainer extends StatelessWidget {
  const PageViewContainer({
    Key? key,
    required this.widget,
    required this.index,
  }) : super(key: key);

  final HomeSlider widget;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      width: double.infinity,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(50)),
        child: Image.asset(
          widget.imageAsset[index],
          fit: BoxFit.fill,
          width: double.infinity,
          height: 350,
        ),
      ),
    );
  }
}
