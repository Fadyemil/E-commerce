import 'dart:io';

import 'package:e_commerce/core/theme/app_text_styles.dart';
import 'package:e_commerce/desh_board/features/add_product/presentation/view/widget/add_oroduct_button.dart';
import 'package:e_commerce/desh_board/features/add_product/presentation/view/widget/image_field.dart';
import 'package:e_commerce/desh_board/features/add_product/presentation/view/widget/is_feature_check_box.dart';
import 'package:e_commerce/desh_board/features/add_product/presentation/view/widget/is_organic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/widget/app_text_form_field.dart';
import '../../manger/add_product/add_product_cubit.dart';

class FormAddProduct extends StatefulWidget {
  const FormAddProduct({
    super.key,
  });

  @override
  State<FormAddProduct> createState() => _FormAddProductState();
}

class _FormAddProductState extends State<FormAddProduct> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool isChecked = false;
  bool isOrganic = false;

  File? image;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<AddProductCubit>().formState,
      autovalidateMode: autovalidateMode,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 600.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ~ Welcome text
            Text(
              "Add New Product",
              style: AppTextStyles.bodyBasaBold16.copyWith(color: Colors.black),
            ),
            SizedBox(height: 24.h),

            // ~ Product name field
            AppTextFormField(
              hintText: 'Product Name',
              validator: (value) => value!.isEmpty ? 'Name is required' : null,
              controller: context.read<AddProductCubit>().nameContoller,
            ),
            SizedBox(height: 16.h),

            // ~ Product price field
            AppTextFormField(
              hintText: 'Product Price',
              validator: (value) => value!.isEmpty ? 'Price is required' : null,
              keyboardType: TextInputType.number,
              controller: context.read<AddProductCubit>().priceContoller,
            ),
            SizedBox(height: 16.h),

            // ~ expiration  field
            AppTextFormField(
              hintText: 'Expiration Months',
              validator: (value) =>
                  value!.isEmpty ? 'EXpiration Price is required' : null,
              keyboardType: TextInputType.number,
              controller: context.read<AddProductCubit>().expirationContoller,
            ),
            SizedBox(height: 16.h),

            // ~ number of calories  field
            AppTextFormField(
              hintText: 'number of calories',
              validator: (value) => value!.isEmpty
                  ? 'number of calories Price is required'
                  : null,
              keyboardType: TextInputType.number,
              controller: context.read<AddProductCubit>().numCaloriesContoller,
            ),
            SizedBox(height: 16.h),

            // ~ unit Amount   field
            AppTextFormField(
              hintText: 'nuit Amount',
              validator: (value) =>
                  value!.isEmpty ? 'nuit Amount  is required' : null,
              keyboardType: TextInputType.number,
              controller: context.read<AddProductCubit>().unitAmountContoller,
            ),
            SizedBox(height: 16.h),

            // ~ Product code field
            AppTextFormField(
              hintText: 'Product Code',
              validator: (value) => value!.isEmpty ? 'Code is required' : null,
              keyboardType: TextInputType.number,
              controller: context.read<AddProductCubit>().codeContoller,
            ),
            SizedBox(height: 16.h),

            // ~ Product description field
            AppTextFormField(
              hintText: 'Product Description',
              validator: (value) =>
                  value!.isEmpty ? 'Description is required' : null,
              maxLength: 200,
              maxlines: 5,
              controller: context.read<AddProductCubit>().desContoller,
            ),
            SizedBox(height: 16.h),

            // ~ Checkbox for marking the product as featured
            IsFeatureCheckBox(
              isTermsAccepted: isChecked,
              onChecked: (value) {
                setState(() {
                  isChecked = value;
                });
              },
            ),
            SizedBox(height: 16.h),

            // ~ Checkbox for marking is orgically
            IsOrganic(
              isTermsAccepted: isOrganic,
              onChecked: (value) {
                setState(() {
                  isOrganic = value;
                });
              },
            ),
            SizedBox(height: 16.h),

            // ~ Image selection field
            ImageField(
              onFileChanged: (File? value) {
                image = value;
              },
            ),
            SizedBox(height: 24.h),

            // ~ Button to add the product
            AddProductButton(
              isChecked: isChecked,
              isOrganic: isOrganic,
              image: image,
            ),
          ],
        ),
      ),
    );
  }
}
