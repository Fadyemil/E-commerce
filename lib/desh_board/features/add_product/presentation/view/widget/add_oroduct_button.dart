import 'package:e_commerce/core/theme/app_text_styles.dart';
import 'package:e_commerce/core/widget/cusstom_button.dart';
import 'package:e_commerce/desh_board/features/add_product/dmain/entites/add_product_input_entity.dart';
import 'package:e_commerce/desh_board/features/add_product/presentation/manger/add_product/add_product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddProductButton extends StatelessWidget {
  const AddProductButton({
    super.key,
    required this.isChecked,
    required this.isOrganic,
  });

  final bool isChecked;
  final bool isOrganic;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: CusstomButton(
        buttonText: 'Add Item',
        textStyle: AppTextStyles.bodyBasaBold16,
        onPressed: () {
          // if (image != null) {
          if (context.read<AddProductCubit>().formState.currentState!.validate()) {
            context.read<AddProductCubit>().formState.currentState!.save();
            // ignore: unused_local_variable
            AddProductInputEntity input = AddProductInputEntity(
              name: context.read<AddProductCubit>().nameContoller.text,
              price: num.parse(context.read<AddProductCubit>().priceContoller.text),
              description: context.read<AddProductCubit>().desContoller.text,
              code: context.read<AddProductCubit>().codeContoller.text,
              // image: image!,
              isFeatured: isChecked,
              isOrganic: isOrganic,
              expirationMonths:
                  int.parse(context.read<AddProductCubit>().expirationContoller.text),
              numberOfCalories:
                  int.parse(context.read<AddProductCubit>().numCaloriesContoller.text),
              unitAmount: int.parse(context.read<AddProductCubit>().unitAmountContoller.text),
              reviews: [],
            );
            context.read<AddProductCubit>().addProduct(input);
          }
          // } else {
          //   ScaffoldMessenger.of(context).showSnackBar(
          //     const SnackBar(
          //         content: Text('Please select an image')),
          //   );
          // }
        },
      ),
    );
  }
}
