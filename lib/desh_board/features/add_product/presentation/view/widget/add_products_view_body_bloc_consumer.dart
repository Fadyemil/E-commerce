import 'package:e_commerce/core/helper_functions/build_error_message.dart';
import 'package:e_commerce/desh_board/features/add_product/presentation/manger/add_product/add_product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'add_product_view_body.dart';

class AddProductsViewBodyBlocConsumer extends StatelessWidget {
  const AddProductsViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductCubit, AddProductState>(
      listener: (context, state) {
        if (state is AddProductSuccess) {
          buildErrorBar(context, 'product added successfully');
        }
        if (state is AddProductFailure) {
          buildErrorBar(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
            inAsyncCall: state is AddProductLoading ? true : false,
            child: AddProductViewBody());
      },
    );
  }
}
