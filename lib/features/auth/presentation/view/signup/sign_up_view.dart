import 'package:e_commerce/features/auth/presentation/view/signup/widget/sign_up_view_body.dart';
import 'package:e_commerce/features/auth/presentation/view/widget/custom_app_bar_auth.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarAuth(title: 'حساب جديد'),
      body: SafeArea(
        child: SignUpViewBody(),
      ),
    );
  }
}
