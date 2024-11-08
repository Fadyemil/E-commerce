import 'package:e_commerce/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

AppBar CustomAppBarAuth({required final String title}) {
  return AppBar(
    title: Text(
      title,
      style: AppTextStyles.bodyLargeBold19,
    ),
    backgroundColor: Colors.white,
    centerTitle: true,
    elevation: 0,
    scrolledUnderElevation: 0,
    leading: IconButton(
      icon: const Icon(Icons.keyboard_arrow_right_sharp),
      onPressed: () {},
    ),
  );
}
