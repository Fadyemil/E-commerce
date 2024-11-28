import 'package:e_commerce/core/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/widget/search_text_field.dart';

class CustomSearch extends StatelessWidget {
  const CustomSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Color(0xff0A000000),
          blurRadius: 9,
          offset: Offset(0, 2),
          spreadRadius: 0,
        ),
      ]),
      child: SearchTextField(
        hintText: 'ابحث عن.......',
        suffixIcon: SizedBox(
            width: 20.w,
            child: Center(child: SvgPicture.asset(Assets.imageFilter))),
        prefixIcon: SizedBox(
            width: 24.w,
            child: Center(child: SvgPicture.asset(Assets.imageSearchIcon))),
      ),
    );
  }
}
