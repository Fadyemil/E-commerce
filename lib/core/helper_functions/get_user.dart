import 'dart:convert';

import 'package:e_commerce/core/constants/constanst.dart';
import 'package:e_commerce/core/services/cache_helper.dart';
import 'package:e_commerce/features/auth/data/model/user_model.dart';
import 'package:e_commerce/features/auth/domain/entites/user_entity.dart';

UserEntity? getUser() {
  var jsonString = CacheHelper().getDataString(key: kUserData);
  if (jsonString != null) {
    var userEntity = UserModel.fromJson(jsonDecode(jsonString) as Map<String, dynamic>);
    return userEntity;
  }
  return null;  // Return null if jsonString is null or invalid
}

