import 'dart:developer';

import 'package:e_commerce/core/cubit/products/products_cubit.dart';
import 'package:e_commerce/core/widget/fruit_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellingGridView extends StatelessWidget {
  const BestSellingGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 8,
        childAspectRatio: 163 / 200,
      ),
      itemCount: context.read<ProductsCubit>().productBsetSelling.length,
      itemBuilder: (context, index) {
        log(context.read<ProductsCubit>().productBsetSelling.length.toString());
        return FruitItem(
          productBsetSelling: context.read<ProductsCubit>().productBsetSelling[index],
        );
      },
    );
  }
}
