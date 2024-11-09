import 'dart:developer';

import 'package:e_commerce/core/errors/exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
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
}
