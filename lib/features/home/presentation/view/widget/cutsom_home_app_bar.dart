import 'package:e_commerce/core/constants/images.dart';
import 'package:e_commerce/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CutsomHomeAppBar extends StatelessWidget {
  const CutsomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(Assets.assetsImagesProfileImage),
      title: Text(
        'صباح الخير !..',
        style: AppTextStyles.bodyBasaRegular16
            .copyWith(color: const Color(0xff949D9E)),
      ),
      subtitle: Text(
        'أحمد مصطفي',
        style: AppTextStyles.bodyBasaBold16.copyWith(color: Colors.black),
      ),
      trailing: Container(
          width: 34.w,
          height: 34.h,
          decoration: const ShapeDecoration(
            shape: OvalBorder(),
            color: Colors.white,
          ),
          child: SvgPicture.asset(Assets.assetsImagesNotification)),
    );
  }
}
