import 'package:e_commerce/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: Color(0xffDDDFDF),
            height: 1.h,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: Text(
            'او',
            textAlign: TextAlign.center,
            style:
                AppTextStyles.bodyBasaSemiBold16.copyWith(color: Colors.black),
          ),
        ),
        Expanded(
          child: Divider(
            color: Color(0xffDDDFDF),
            height: 1.h,
          ),
        ),
      ],
    );
  }
}
