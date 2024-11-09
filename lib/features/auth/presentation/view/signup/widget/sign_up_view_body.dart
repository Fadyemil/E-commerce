import 'package:e_commerce/features/auth/presentation/view/signup/widget/have_an_accont.dart';
import 'package:e_commerce/features/auth/presentation/view/signup/widget/sign_up_from_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpViewBody extends StatefulWidget {
  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(height: 25.h),
            SignUpFromField(),
            SizedBox(height: 33.h),
            const Center(
              child: HaveAnAccont(),
            ),
          ],
        ),
      ),
    );
  }
}
