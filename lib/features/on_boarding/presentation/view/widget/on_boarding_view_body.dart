import 'package:dots_indicator/dots_indicator.dart';
import 'package:e_commerce/core/theme/app_colors.dart';
import 'package:e_commerce/core/theme/app_text_styles.dart';
import 'package:e_commerce/core/widget/cusstom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'on_boarding_page_view.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  late PageController pageController;
  int currentIndexPage = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentIndexPage = pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: OnBoardingPageView(
            controller: pageController,
          ),
        ),
        DotsIndicator(
          dotsCount: 2,
          position: currentIndexPage,
          decorator: DotsDecorator(
            color: currentIndexPage == 0
                ? AppColors.green500
                : AppColors.green1_500,
          ),
        ),
        SizedBox(height: 16.h),
        Visibility(
          visible: currentIndexPage == 1,
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: CusstomButton(
              buttonText: 'ابدأ الان',
              textStyle: AppTextStyles.bodyBasaBold16,
              onPressed: () {},
            ),
          ),
        )
      ],
    );
  }
}
