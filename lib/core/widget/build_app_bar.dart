import 'package:e_commerce/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../features/best_selling_fruits/presentation/view/widget/notification_widget.dart';

AppBar BuildAppBar(BuildContext context, String title) {
  return AppBar(
    title: Text(
      title,
      style: AppTextStyles.bodyLargeBold19,
    ),
    centerTitle: true,
    elevation: 0,
    scrolledUnderElevation: 0,
    leading: IconButton(
      icon: const Icon(Icons.keyboard_arrow_right_sharp),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
    actions: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: NotificationWidget(),
      ),
    ],
  );
}
