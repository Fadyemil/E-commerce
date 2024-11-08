import 'package:e_commerce/core/theme/app_colors.dart';
import 'package:e_commerce/core/widget/app_text_form_field.dart';
import 'package:e_commerce/core/widget/cusstom_button.dart';
import 'package:e_commerce/features/auth/presentation/view/signup/widget/have_an_accont.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/theme/app_text_styles.dart';
import 'terms_and_conitions.dart';

class SignUpViewBody extends StatefulWidget {
  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  bool isObscureText = true;
  bool isTermsAccepted = false;
  @override
  void initState() {
    super.initState();

    isTermsAccepted = false;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(height: 25.h),
            AppTextFormField(
              hintText: 'الاسم كامل',
              keyboardType: TextInputType.emailAddress,
              validator: (value) {},
            ),
            SizedBox(height: 16.h),
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
            TermsAndConitions(
              isTermsAccepted: isTermsAccepted,
              onChecked: (value) {
                setState(() {
                  isTermsAccepted = value;
                });
              },
            ),
            SizedBox(height: 16.h),
            CusstomButton(
              buttonText: 'إنشاء حساب جديد',
              textStyle: AppTextStyles.bodyBasaBold16,
              onPressed: isTermsAccepted ? () {} : () {},
              backgroundColor: isTermsAccepted ? null : AppColors.grayscale300,
            ),
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
