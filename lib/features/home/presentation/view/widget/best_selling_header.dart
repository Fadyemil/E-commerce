import 'package:e_commerce/core/theme/app_colors.dart';
import 'package:e_commerce/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class BestSellingHeader extends StatelessWidget {
  const BestSellingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(
            'الأكثر مبيعًا',
            style: AppTextStyles.bodyBasaBold16.copyWith(color: Colors.black),
          ),
          Spacer(),
          Text(
            'المزيد',
            style: AppTextStyles.bodySmallBold13.copyWith(
              color: AppColors.grayscale400,
            ),
          ),
        ],
      ),
    );
  }
}
