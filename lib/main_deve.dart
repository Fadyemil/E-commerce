import 'package:device_preview/device_preview.dart';
import 'package:e_commerce/core/helper_functions/router/router.dart';
import 'package:e_commerce/core/services/cache_helper.dart';
import 'package:e_commerce/main.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPrefs = CacheHelper();
  await sharedPrefs.init();
  final GoRouter router = initializeRouter();
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) {
        return FruitHub(router: router);
      },
    ),
  );
}