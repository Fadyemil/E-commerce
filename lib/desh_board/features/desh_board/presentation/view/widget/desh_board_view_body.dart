import 'package:e_commerce/core/theme/app_text_styles.dart';
import 'package:e_commerce/core/widget/cusstom_button.dart';
import 'package:e_commerce/desh_board/core/helper_functions/router/router_name_d_b.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DeshBoardViewBody extends StatelessWidget {
  const DeshBoardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CusstomButton(
            buttonText: 'add Data',
            textStyle: AppTextStyles.bodyLargeRegular19,
            onPressed: () {
              context.pushNamed(RouterNameDB.addProduct);
            },
          ),
          CusstomButton(
            buttonText: 'update Data',
            textStyle: AppTextStyles.bodyLargeRegular19,
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
