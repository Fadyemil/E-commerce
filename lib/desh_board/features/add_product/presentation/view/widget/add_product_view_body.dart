import 'dart:io';

import 'package:e_commerce/core/theme/app_text_styles.dart';
import 'package:e_commerce/core/widget/app_text_form_field.dart';
import 'package:e_commerce/core/widget/cusstom_button.dart';
import 'package:e_commerce/desh_board/features/add_product/dmain/entites/add_product_input_entity.dart';
import 'package:e_commerce/desh_board/features/add_product/presentation/manger/add_product/add_product_cubit.dart';
import 'package:e_commerce/desh_board/features/add_product/presentation/view/widget/image_field.dart';
import 'package:e_commerce/desh_board/features/add_product/presentation/view/widget/is_feature_check_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool isChecked = false;

  TextEditingController nameContoller = TextEditingController();
  TextEditingController priceContoller = TextEditingController();
  TextEditingController codeContoller = TextEditingController();
  TextEditingController desContoller = TextEditingController();
  File? image;

  @override
  void initState() {
    super.initState();
    isChecked = false;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
          child: Form(
            key: _formState,
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
                    style: AppTextStyles.bodyBasaBold16
                        .copyWith(color: Colors.black),
                  ),
                  SizedBox(height: 24.h),

                  // ~ Product name field
                  AppTextFormField(
                    hintText: 'Product Name',
                    validator: (value) =>
                        value!.isEmpty ? 'Name is required' : null,
                    controller: nameContoller,
                  ),
                  SizedBox(height: 16.h),

                  // ~ Product price field
                  AppTextFormField(
                    hintText: 'Product Price',
                    validator: (value) =>
                        value!.isEmpty ? 'Price is required' : null,
                    keyboardType: TextInputType.number,
                    controller: priceContoller,
                  ),
                  SizedBox(height: 16.h),

                  // ~ Product code field
                  AppTextFormField(
                    hintText: 'Product Code',
                    validator: (value) =>
                        value!.isEmpty ? 'Code is required' : null,
                    keyboardType: TextInputType.number,
                    controller: codeContoller,
                  ),
                  SizedBox(height: 16.h),

                  // ~ Product description field
                  AppTextFormField(
                    hintText: 'Product Description',
                    validator: (value) =>
                        value!.isEmpty ? 'Description is required' : null,
                    maxLength: 200,
                    maxlines: 5,
                    controller: desContoller,
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

                  // ~ Image selection field
                  ImageField(
                    onFileChanged: (File? value) {
                      image = value;
                    },
                  ),
                  SizedBox(height: 24.h),

                  // ~ Button to add the product
                  Align(
                    alignment: Alignment.center,
                    child: CusstomButton(
                      buttonText: 'Add Item',
                      textStyle: AppTextStyles.bodyBasaBold16,
                      onPressed: () {
                        if (image != null) {
                          if (_formState.currentState!.validate()) {
                            _formState.currentState!.save();
                            // ignore: unused_local_variable
                            AddProductInputEntity input = AddProductInputEntity(
                              name: nameContoller.text,
                              price: num.parse(priceContoller.text),
                              description: desContoller.text,
                              code: codeContoller.text,
                              image: image!,
                              isFeatured: isChecked,
                            );
                            context.read<AddProductCubit>().addProduct(input);
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Please select an image')),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
