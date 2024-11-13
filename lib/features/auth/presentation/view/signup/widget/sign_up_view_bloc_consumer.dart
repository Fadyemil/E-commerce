import 'package:e_commerce/core/helper_functions/router/router_name.dart';
import 'package:e_commerce/features/auth/presentation/view/signup/widget/sign_up_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../../core/helper_functions/build_error_message.dart';
import '../../../manger/sign_up/sign_up_cubit.dart';

class SignUpViewBlocConsumer extends StatelessWidget {
  const SignUpViewBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('تم التسجيل بنجاح'),
            ),
          );
          context.goNamed(RouterName.login);
        }
        if (state is SignUpError) {
          buildErrorBar(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is SignUpLoading ? true : false,
          child: SignUpViewBody(),
        );
      },
    );
  }
}
