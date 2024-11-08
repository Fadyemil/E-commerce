import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_commerce/core/constants/images.dart';
import 'package:e_commerce/core/theme/app_colors.dart';
import 'package:e_commerce/core/theme/app_text_styles.dart';
import 'package:e_commerce/core/widget/app_text_form_field.dart';
import 'package:e_commerce/core/widget/cusstom_button.dart';
import 'package:e_commerce/features/auth/presentation/view/login/widget/dont_have_an_accont.dart';
import 'package:e_commerce/features/auth/presentation/view/login/widget/or_divider.dart';
import 'package:e_commerce/features/auth/presentation/view/login/widget/social_login_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(height: 25.h),
            AppTextFormField(
              hintText: 'البريد الإلكتروني',
              keyboardType: TextInputType.emailAddress,
              validator: (value) {},
            ),
            SizedBox(height: 16.h),
            AppTextFormField(
              hintText: 'كلمة المرور',
              validator: (value) {},
              isObscureText: isObscureText,
              keyboardType: TextInputType.visiblePassword,
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    isObscureText = !isObscureText;
                  });
                },
                child: Icon(
                  isObscureText ? Icons.visibility_off : Icons.visibility,
                  color: const Color(0xffC9CECF),
                ),
              ),
            ),
            SizedBox(height: 16.h),
            AutoSizeText(
              'نسيت كلمة المرور؟',
              style: AppTextStyles.bodySmallSemiBold13.copyWith(
                color: AppColors.green1_600,
              ),
            ),
            SizedBox(height: 33.h),
            CusstomButton(
              buttonText: 'تسجيل دخول',
              textStyle: AppTextStyles.bodyBasaBold16,
              onPressed: () {},
            ),
            SizedBox(height: 33.h),
            const Center(
              child: DontHaveAnAccont(),
            ),
            SizedBox(height: 33.h),
            const OrDivider(),
            SizedBox(height: 33.h),
            // Google Sign-In Button
            SocialLoginButton(
              title: 'تسجيل بواسطة جوجل',
              image: Assets.assetsImagesGoogleIcon,
              onPressed: () {},
            ),
            SizedBox(height: 10),
            // Apple Sign-In Button
            SocialLoginButton(
              title: 'تسجيل بواسطة أبل',
              image: Assets.assetsImagesApplIcon,
              onPressed: () {},
            ),
            SizedBox(height: 10),
            // Facebook Sign-In Button
            SocialLoginButton(
              title: 'تسجيل بواسطة جوجل',
              image: Assets.assetsImagesFacebookIcon,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
