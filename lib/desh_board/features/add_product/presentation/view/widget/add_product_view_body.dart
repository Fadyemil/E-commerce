import 'dart:io';

import 'package:e_commerce/core/widget/app_text_form_field.dart';
import 'package:e_commerce/desh_board/features/add_product/presentation/view/widget/image_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formState,
        autovalidateMode: autovalidateMode,
        child: Column(
          children: [
            AppTextFormField(
              hintText: 'Product Name',
              validator: (value) {},
            ),
            SizedBox(height: 16.h),
            AppTextFormField(
              hintText: 'Product Price',
              validator: (value) {},
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16.h),
            AppTextFormField(
              hintText: 'Product code',
              validator: (value) {},
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16.h),
            AppTextFormField(
              hintText: 'Product Description',
              validator: (value) {},
              maxLength: 200,
              maxlines: 5,
            ),
            SizedBox(height: 16.h),
            ImageField(
              onFileChanged: (File? value) {},
            )
          ],
        ),
      ),
    );
  }
}
