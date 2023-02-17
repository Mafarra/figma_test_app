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
  );
  Icon disabledlikeIcon = Icon(
    Icons.favorite_border,
    color: AppColor.redColor,
  );
  bool isSelected = false;
  final _pageController = PageController(viewportFraction: 0.8, keepPage: true);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 300,
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
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(40)),
                      child: Image.asset(
                        widget.imageAsset[index],
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 300,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 80.07,
                    left: 18.33,
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: AppColor.whiteColor,
                          radius: 20,
                          child: Padding(
                            padding: const EdgeInsets.all(0.5),
                            child: IconButton(
                              icon: isSelected
                                  ? selectedlikeIcon
                                  : disabledlikeIcon,
                              onPressed: () {
                                setState(() {
                                  isSelected = !isSelected;
                                });
                              },
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CircleAvatar(
                          backgroundColor: AppColor.whiteColor,
                          radius: 20,
                          child: Padding(
                            padding: const EdgeInsets.all(0.5),
                            child: IconButton(
                              icon: Icon(
                                Icons.repeat,
                                color: AppColor.goldColor,
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CircleAvatar(
                          backgroundColor: AppColor.whiteColor,
                          radius: 20,
                          child: Padding(
                            padding: const EdgeInsets.all(0.5),
                            child: IconButton(
                              icon: Icon(
                                Icons.share_outlined,
                                color: AppColor.blackColor,
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
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
                controller: _pageController,
                count: widget.imageAsset.length,
                onDotClicked: (index) {
                  _pageController.jumpToPage(index);
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
}
