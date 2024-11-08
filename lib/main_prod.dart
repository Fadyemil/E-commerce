import 'package:e_commerce/core/services/cache_helper.dart';
import 'package:e_commerce/firebase_options.dart';
import 'package:e_commerce/main.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';

import 'core/helper_functions/router/router.dart';
import 'core/helper_functions/security.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPrefs = CacheHelper();
  await sharedPrefs.init();
  final GoRouter router = initializeRouter();
  await dotenv.load(fileName: Security.filename);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(FruitHub(router: router));
}
