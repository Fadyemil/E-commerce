import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_commerce/features/auth/presentation/manger/login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../core/widget/app_text_form_field.dart';
import '../../../../../../core/widget/cusstom_button.dart';

class LoginFromField extends StatefulWidget {
  const LoginFromField({super.key});

  @override
  State<LoginFromField> createState() => _LoginFromFieldState();
}

class _LoginFromFieldState extends State<LoginFromField> {
  bool isObscureText = true;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          AppTextFormField(
            hintText: 'البريد الإلكتروني',
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'رجاء ادخال البريد الإلكتروني';
              }
            },
            controller: context.read<LoginCubit>().emailContoller,
          ),
          SizedBox(height: 16.h),
          AppTextFormField(
            hintText: 'كلمة المرور',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'رجاء ادخال كلمة المرور';
              }
            },
            controller: context.read<LoginCubit>().passwordContoller,
            isObscureText: isObscureText,
            keyboardType: TextInputType.visiblePassword,
            maxlines: 1,
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
            onPressed: () {
              if (context.read<LoginCubit>().formKey.currentState!.validate()) {
                context.read<LoginCubit>().login();
              } else {
                setState(() {
                  autovalidateMode = AutovalidateMode.always;
                });
              }
            },
          ),
        ],
      ),
    );
  }
}
