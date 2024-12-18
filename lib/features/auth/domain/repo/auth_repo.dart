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

  Future<Either<Faliure, UserEntity>> addUserData({required UserEntity user});

  Future<dynamic> saveUserData({required UserEntity user});

  Future<UserEntity> getUserData({required String uId});
}
