import 'package:e_commerce/core/DI/dependency_injection.dart';
import 'package:e_commerce/features/auth/domain/repo/auth_repo.dart';
import 'package:e_commerce/features/auth/presentation/manger/sign_up/sign_up_cubit.dart';
import 'package:e_commerce/features/auth/presentation/view/signup/widget/sign_up_view_bloc_consumer.dart';
import 'package:e_commerce/features/auth/presentation/view/widget/custom_app_bar_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(
        getIt<AuthRepo>(),
      ),
      child: Scaffold(
        appBar: CustomAppBarAuth(title: 'حساب جديد'),
        body: SafeArea(
          child: SignUpViewBlocConsumer(),
        ),
      ),
    );
  }
}


