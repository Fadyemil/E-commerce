import 'package:e_commerce/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.backgroundImage,
    required this.image,
    required this.visible,
  });
  final bool visible;
  final String subtitle, backgroundImage, image;
  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.sizeOf(context).height * 0.5,
          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(
                  backgroundImage,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: SvgPicture.asset(
                  image,
                ),
              ),
              Visibility(
                visible: visible,
                child: Positioned(
                  right: 8.w,
                  child: Text(
                    'تخط',
                    style: AppTextStyles.bodySmallBold13
                        .copyWith(color: const Color(0xff949D9E)),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 64.h),
        title,
        SizedBox(height: 24.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            subtitle,
            textAlign: TextAlign.center,
            style: AppTextStyles.bodySmallBold13
                .copyWith(color: Color(0xff4E5556)),
          ),
        )
      ],
    );
  }
}
