import 'package:e_commerce/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Color? backgroundColor;
  final TextEditingController? controller;
  final String? Function(String?) validator;
  final TextInputType? keyboardType;
  final int? maxLength;
  final int? maxlines;
  const AppTextFormField({
    super.key,
    this.keyboardType,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    required this.hintText,
    this.isObscureText,
    this.suffixIcon,
    this.backgroundColor,
    this.controller,
    required this.validator,
    this.maxLength,
    this.maxlines,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      maxLength: maxLength,
      maxLines: maxlines,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0xffE6E9EA),
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(4.r),
            ),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0xffE6E9EA),
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(4.r),
            ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(4.r),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(4.r),
        ),
        hintStyle: hintStyle ?? AppTextStyles.bodySmallBold13,
        hintText: hintText,
        suffixIcon: suffixIcon,
        fillColor: backgroundColor ?? Color(0xffF9FAFA),
        filled: true,
      ),
      obscureText: isObscureText ?? false,
      style:
          AppTextStyles.bodyBasaSemiBold16.copyWith(color: Color(0xff0C0D0D)),
      validator: (value) {
        return validator(value);
      },
    );
  }
}
