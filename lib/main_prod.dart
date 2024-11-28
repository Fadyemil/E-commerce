import 'package:e_commerce/core/DI/dependency_injection.dart';
import 'package:e_commerce/core/services/cache_helper.dart';
import 'package:e_commerce/core/services/custom_bloc_server.dart';
import 'package:e_commerce/firebase_options.dart';
import 'package:e_commerce/main.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  setupGetit();
  Bloc.observer = CustomBlocServer();
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp],
  ).then((_) {
    runApp(FruitHub(router: router));
  });
}
