import 'dart:developer';

import 'package:e_commerce/core/errors/exceptions.dart';
import 'package:e_commerce/core/services/auth_service_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService implements AuthServiceRepo {
  //~ Create User with Email and Password
  @override
  Future<User> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw CustomException(message: '  كلمة المرور ضعيفة. ');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
            message: 'لقد تم استخدام هذا البريد الإلكتروني من قبل.');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'تاكد من الاتصال بالانترنت');
      } else {
        throw CustomException(
            message: 'لقد حدث خطأ ما. الرجاء المحاولة مرة أخرى.');
      }
    } catch (e) {
      log('Exception in createUserWithEmailAndPassword $e');
      throw CustomException(
          message: 'لقد حدث خطأ ما. الرجاء المحاولة مرة أخرى.');
    }
  }

  //~ Sign In with Email and Password
  @override
  Future<User> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log('Exception in FirebaseAuthException signInWithEmailAndPassword $e');
      if (e.code == 'user-not-found') {
        log('11111111111111111111111111111111111111');
        throw CustomException(
            message: 'لا يوجد مستخدم بهذا البريد الإلكتروني.');
      } else if (e.code == 'wrong-password') {
        throw CustomException(message: 'كلمة المرور غير صحيحة.');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'تاكد من الاتصال بالانترنت');
      } else if (e.code == 'invalid-credential') {
        throw CustomException(
            message:
                'بيانات الاعتماد غير صالحة. يرجى التحقق من البريد الإلكتروني وكلمة المرور.');
      } else {
        throw CustomException(
            message: ' *********لقد حدث خطأ ما. الرجاء المحاولة مرة أخرى.');
      }
    } catch (e) {
      log('Exception in signInWithEmailAndPassword $e');
      throw CustomException(
          message: ' لقد حدث خطأ ما. الرجاء المحاولة مرة أخرى.');
    }
  }

  //~ Sign in with Google
  @override
  Future<User> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      final userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      return userCredential.user!;
    } catch (e) {
      log('Exception in signInWithGoogle $e');
      throw CustomException(
          message: 'لقد حدث خطأ ما. الرجاء المحاولة مرة أخرى.');
    }
  }

  //~ Sign in with facebook
  @override
  Future<User> signInWithFacebook() async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);
      return (await FirebaseAuth.instance
              .signInWithCredential(facebookAuthCredential))
          .user!;
    } catch (e) {
      log('Exception in signInWithFacebook $e');
      throw CustomException(
          message: 'لقد حدث خطأ ما. الرجاء المحاولة مرة أخرى.');
    }
  }

  //~ delete user
  @override
  Future<void> deleteUser() async {
    try {
      await FirebaseAuth.instance.currentUser!.delete();
    } catch (e) {
      log('Exception in deleteUser $e');
      throw CustomException(message: 'لقد حدث خطأ ما. الرجاء المحاولة مرة أخرى.');
    }
  }
}
