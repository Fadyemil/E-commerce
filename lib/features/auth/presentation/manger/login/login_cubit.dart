import 'package:bloc/bloc.dart';
import 'package:e_commerce/features/auth/domain/entites/user_entity.dart';
import 'package:e_commerce/features/auth/domain/repo/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());

  TextEditingController emailContoller = TextEditingController();
  TextEditingController passwordContoller = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final AuthRepo authRepo;

  Future<void> login() async {
    emit(LoginLoading());
    final result = await authRepo.signInwithEmailandPassword(
        emailContoller.text, passwordContoller.text);
    result.fold(
      (failure) => emit(LoginFailure(message: failure.message)),
      (userEntity) => emit(
        LoginSuccess(userEntity: userEntity),
      ),
    );
  }

  Future<void> loginWithGoogle() async {
    emit(LoginLoading());
    final result = await authRepo.signInWithGoogle();
    result.fold(
      (failure) => emit(LoginFailure(message: failure.message)),
      (userEntity) => emit(
        LoginSuccess(userEntity: userEntity),
      ),
    );
  }

  Future<void> loginWithFacebook() async {
    emit(LoginLoading());
    final result = await authRepo.signInWithFacebook();
    result.fold(
      (failure) => emit(LoginFailure(message: failure.message)),
      (userEntity) => emit(
        LoginSuccess(userEntity: userEntity),
      ),
    );
  }
}
