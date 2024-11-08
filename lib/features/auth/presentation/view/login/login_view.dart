import 'package:e_commerce/features/auth/presentation/view/login/widget/login_view_body.dart';
import 'package:e_commerce/features/auth/presentation/view/widget/custom_app_bar_auth.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarAuth(title: 'تسجيل دخول'),
      body: SafeArea(
        child: LoginViewBody(),
      ),
    );
  }
}
