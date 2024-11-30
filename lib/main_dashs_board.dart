import 'package:e_commerce/core/DI/dependency_injection.dart';
import 'package:e_commerce/core/services/custom_bloc_server.dart';
import 'package:e_commerce/desh_board/core/helper_functions/router/router_d_b.dart';
import 'package:e_commerce/desh_board/core/server/supabase_storage_server.dart';
import 'package:e_commerce/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = CustomBlocServer();
  final GoRouter router = initializeRouterDB();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupGetit();
  await SupabaseStorageServer.initSupabase();
  await SupabaseStorageServer.createBuckets('fruits_images');
  runApp(MainDashsBoard(router: router));
}

class MainDashsBoard extends StatelessWidget {
  const MainDashsBoard({super.key, required this.router});
  final GoRouter router;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: router,
      ),
    );
  }
}
