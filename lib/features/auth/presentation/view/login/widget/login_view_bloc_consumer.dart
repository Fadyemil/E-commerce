import 'package:e_commerce/core/helper_functions/build_error_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../manger/login/login_cubit.dart';
import 'login_view_body.dart';

class LoginViewBlocConsumer extends StatelessWidget {
  const LoginViewBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('تم التسجيل بنجاح'),
            ),
          );
        }
        if (state is LoginFailure) {
          buildErrorBar(context, state.message);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
            inAsyncCall: state is LoginLoading ? true : false,
            child: LoginViewBody());
      },
    );
  }
}
