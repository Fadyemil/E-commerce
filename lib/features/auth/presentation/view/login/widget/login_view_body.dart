import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io' show Platform; // Ensure dart:io is only imported when targeting mobile platforms

import 'package:e_commerce/core/constants/images.dart';
import 'package:e_commerce/features/auth/presentation/manger/login/login_cubit.dart';
import 'package:e_commerce/features/auth/presentation/view/login/widget/dont_have_an_accont.dart';
import 'package:e_commerce/features/auth/presentation/view/login/widget/login_from_field.dart';
import 'package:e_commerce/features/auth/presentation/view/login/widget/or_divider.dart';
import 'package:e_commerce/features/auth/presentation/view/login/widget/social_login_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(height: 25.h),
            LoginFromField(),
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
              onPressed: () async {
                await context.read<LoginCubit>().loginWithGoogle();
              },
            ),
            SizedBox(height: 10.h),
            // Apple Sign-In Button
            if (!kIsWeb && Platform.isIOS)
              Column(
                children: [
                  SocialLoginButton(
                    title: 'تسجيل بواسطة أبل',
                    image: Assets.assetsImagesApplIcon,
                    onPressed: () {},
                  ),
                  SizedBox(height: 10.h),
                ],
              )
            else
              SizedBox(),
            // Facebook Sign-In Button
            SocialLoginButton(
              title: 'تسجيل بواسطة فيسبوك',
              image: Assets.assetsImagesFacebookIcon,
              onPressed: () {
                context.read<LoginCubit>().loginWithFacebook();
              },
            ),
          ],
        ),
      ),
    );
  }
}
