import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/faliures.dart';
import 'package:e_commerce/features/auth/domain/entites/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Faliure, UserEntity>> createUserwithEmailandPassword(
    String email,
    String password,
    String name,
  );

  Future<Either<Faliure, UserEntity>> signInwithEmailandPassword(
    String email,
    String password,
  );

  Future<Either<Faliure, UserEntity>> signInWithGoogle();

  Future<Either<Faliure, UserEntity>> signInWithFacebook();

  Future addUserData({required UserEntity user});

  Future<UserEntity> getUserData({required String uId});
}
