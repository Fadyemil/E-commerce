import 'package:bloc/bloc.dart';
import 'package:e_commerce/features/auth/domain/entites/user_entity.dart';
import 'package:e_commerce/features/auth/domain/repo/auth_repo.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.authRepo) : super(SignUpInitial());

  final AuthRepo authRepo;

  TextEditingController nameContoller = TextEditingController();
  TextEditingController emailContoller = TextEditingController();
  TextEditingController passwordContoller = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> createUserwithEmailandPassword() async {
    emit(SignUpLoading());
    final result = await authRepo.createUserwithEmailandPassword(
        emailContoller.text, passwordContoller.text, nameContoller.text);
    result.fold(
      (failure) => emit(SignUpError(errorMessage: failure.message)),
      (userEntity) => emit(
        SignUpSuccess(userEntity: userEntity),
      ),
    );
  }
}
