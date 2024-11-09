import 'dart:developer';

import 'package:e_commerce/core/errors/exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  //~ Create User with Email and Password
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
}
