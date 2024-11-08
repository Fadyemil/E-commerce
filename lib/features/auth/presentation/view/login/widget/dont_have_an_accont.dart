import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_commerce/core/helper_functions/router/router_name.dart';
import 'package:e_commerce/core/theme/app_colors.dart';
import 'package:e_commerce/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DontHaveAnAccont extends StatelessWidget {
  const DontHaveAnAccont({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.goNamed(RouterName.signUP);
      },
      child: AutoSizeText.rich(
        TextSpan(
          children: [
            TextSpan(
              text: 'لا تمتلك حساب؟',
              style: AppTextStyles.bodyBasaSemiBold16.copyWith(
                color: AppColors.grayscale400,
              ),
            ),
            TextSpan(
              text: 'قم بانشاء حساب',
              style: AppTextStyles.bodyBasaSemiBold16.copyWith(
                color: AppColors.green1_500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
