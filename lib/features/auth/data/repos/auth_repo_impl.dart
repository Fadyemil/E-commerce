import 'dart:async';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/exceptions.dart';
import 'package:e_commerce/core/errors/faliures.dart';
import 'package:e_commerce/core/services/firebase_auth_service.dart';
import 'package:e_commerce/core/services/firestore_service.dart';
import 'package:e_commerce/core/utils/endpoind.dart';
import 'package:e_commerce/features/auth/data/model/user_model.dart';
import 'package:e_commerce/features/auth/domain/entites/user_entity.dart';
import 'package:e_commerce/features/auth/domain/repo/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final FirestoreService firestoreService;

  AuthRepoImpl(
      {required this.firebaseAuthService, required this.firestoreService});
  @override
  Future<Either<Faliure, UserEntity>> createUserwithEmailandPassword(
      String email, String password, String name) async {
    User? user;
    try {
      user = await firebaseAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      var userEntity =
          UserModel.fromFirebaseUser(user, password: password).copyWith(
        name: name,
        uId: name + " " + user.uid,
      );
      await addUserData(user: userEntity);

      return Right(UserModel.fromFirebaseUser(user, password: password));
    } on CustomException catch (e) {
      await deleteUser(user);
      return Left(ServerFaliure(e.message));
    } catch (e) {
      await deleteUser(user);
      log('Exception in CreateUserwithEmailandPassword $e');
      return Left(ServerFaliure('An error occurred .Please try again.'));
    }
  }

  Future<void> deleteUser(User? user) async {
    if (user != null) {
      await firebaseAuthService.deleteUser();
    }
  }

  @override
  Future<Either<Faliure, UserEntity>> signInwithEmailandPassword(
      String email, String password) async {
    try {
      var user = await firebaseAuthService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return Left(ServerFaliure(e.message));
    } catch (e) {
      log('Exception in AuthRepoImpl.signInwithEmailandPassword $e');
      return Left(ServerFaliure('حدث خطأ ما. الرجاء المحاولة مرة أخرى.'));
    }
  }

  @override
  Future<Either<Faliure, UserEntity>> signInWithGoogle() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithGoogle();

      var userEntity = UserModel.fromFirebaseUser(user).copyWith(
        uId: user.displayName! + " " + user.uid,
      );
      await addUserData(user: userEntity);

      return Right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      await deleteUser(user);
      return Left(ServerFaliure(e.message));
    } catch (e) {
      await deleteUser(user);
      log('Exception in AuthRepoImpl.signInWithGoogle $e');
      return Left(ServerFaliure('حدث خطأ ما. الرجاء المحاولة مرة أخرى.'));
    }
  }

  @override
  Future<Either<Faliure, UserEntity>> signInWithFacebook() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithFacebook();

      var userEntity = UserModel.fromFirebaseUser(user).copyWith(
        uId: user.displayName! + " " + user.uid,
      );
      await addUserData(user: userEntity);

      return Right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      await deleteUser(user);
      return Left(ServerFaliure(e.message));
    } catch (e) {
      await deleteUser(user);
      log('Exception in AuthRepoImpl.signInWithFacebook $e');
      return Left(ServerFaliure('حدث خطأ ما. الرجاء المحاولة مرة أخرى.'));
    }
  }

  @override
  Future addUserData({required UserEntity user}) async {
    try {
      await firestoreService.addDocument(
          collectionPath: EndPoint.addUserData,
          data: user.toMap(),
          documentId: user.uId);
      return Right(user);
    } catch (e) {
      log('Exception in AuthRepoImpl.addData $e');
      return Left(ServerFaliure('حدث خطأ ما. الرجاء المحاولة مرة أخرى.'));
    }
  }
}
