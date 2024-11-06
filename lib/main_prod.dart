import 'package:e_commerce/core/services/cache_helper.dart';
import 'package:e_commerce/main.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'core/helper_functions/router/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPrefs = CacheHelper();
  await sharedPrefs.init();
  final GoRouter router = initializeRouter();
  runApp(FruitHub(router: router));
}
