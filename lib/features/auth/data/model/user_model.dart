import 'package:e_commerce/features/auth/domain/entites/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel extends UserEntity {
  UserModel(
      {required super.email,
      required super.name,
      required super.uId,
      required super.password});

  factory UserModel.fromFirebaseUser(User user, {String? password}) {
    return UserModel(
      email: user.email ?? '',
      name: user.displayName ?? '',
      uId: user.uid,
      password: password ?? "",
    );
  }

  // Define the copyWith method
  UserModel copyWith(
      {String? email, String? name, String? uId, String? password}) {
    return UserModel(
      email: email ?? this.email,
      name: name ?? this.name,
      uId: uId ?? this.uId,
      password: password ?? this.password,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'] as String? ?? '',
      name: json['name'] as String? ?? '',
      uId: json['uid'] as String? ?? '',
      password: json['password'] as String? ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'uId': uId,
      'password': password,
    };
  }

  factory UserModel.fromEntity(UserEntity user) {
    return UserModel(
      email: user.email,
      name: user.name,
      uId: user.uId,
      password: user.password,
    );
  }
}
