import 'package:e_commerce/core/DI/dependency_injection.dart';
import 'package:e_commerce/core/helper_functions/router/router_name.dart';
import 'package:e_commerce/features/auth/presentation/manger/login/login_cubit.dart';
import 'package:e_commerce/features/auth/presentation/manger/sign_up/sign_up_cubit.dart';
import 'package:e_commerce/features/auth/presentation/view/login/login_view.dart';
import 'package:e_commerce/features/auth/presentation/view/signup/sign_up_view.dart';
import 'package:e_commerce/features/home/presentation/view/home_view.dart';
import 'package:e_commerce/features/on_boarding/presentation/view/on_boarding_view.dart';
import 'package:e_commerce/features/splash/presentation/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../features/auth/domain/repo/auth_repo.dart';

GoRouter createRouter(String initialLocation) {
  return GoRouter(
    initialLocation: initialLocation,
    routes: [
      GoRoute(
        path: RouterName.splashScreen,
        name: RouterName.splashScreen,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: RouterName.onBoarding,
        name: RouterName.onBoarding,
        builder: (context, state) => const OnBoardingView(),
      ),
      GoRoute(
        path: RouterName.home,
        name: RouterName.home,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: RouterName.login,
        name: RouterName.login,
        builder: (context, state) => BlocProvider(
          create: (context) => LoginCubit(
            getIt<AuthRepo>(),
          ),
          child: const LoginView(),
        ),
      ),
      GoRoute(
        path: RouterName.signUP,
        name: RouterName.signUP,
        builder: (context, state) => BlocProvider(
          create: (context) => SignUpCubit(
            getIt<AuthRepo>(),
          ),
          child: const SignUpView(),
        ),
      ),
    ],
  );
}

GoRouter initializeRouter() {
  return createRouter(RouterName.splashScreen);
}
