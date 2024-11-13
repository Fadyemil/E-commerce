import 'package:e_commerce/core/constants/images.dart';
import 'package:e_commerce/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 214.h,
      width: 163.w,
      decoration: ShapeDecoration(
        color: Color(0xffF3F5F7),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.r),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.favorite_border),
            ),
          ),
          Positioned.fill(
            child: Column(
              children: [
                SizedBox(height: 20.h),
                Image.asset(Assets.assetsImagesWatermelonTest),
                ListTile(
                  title: Text(
                    'بطيخ',
                    style: AppTextStyles.bodySmallSemiBold13,
                  ),
                  subtitle: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '30 جنية /',
                          style: AppTextStyles.bodySmallBold13.copyWith(
                            color: Color(0xffF4A91F),
                          ),
                        ),
                        TextSpan(
                          text: ' كيلو ',
                          style: AppTextStyles.bodySmallBold13.copyWith(
                            color: Color(0xffF8C76D),
                          ),
                        ),
                      ],
                    ),
                  ),
                  trailing: IconButton.filled(
                    iconSize: 32.r,
                    onPressed: () {},
                    icon: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          WidgetStateProperty.all(Color(0xff1B5E37)),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
