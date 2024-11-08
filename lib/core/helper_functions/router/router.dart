import 'package:e_commerce/core/helper_functions/router/router_name.dart';
import 'package:e_commerce/features/auth/presentation/view/login/login_view.dart';
import 'package:e_commerce/features/auth/presentation/view/signup/sign_up_view.dart';
import 'package:e_commerce/features/on_boarding/presentation/view/on_boarding_view.dart';
import 'package:e_commerce/features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

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
        path: RouterName.login,
        name: RouterName.login,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: RouterName.signUP,
        name: RouterName.signUP,
        builder: (context, state) => const SignUpView(),
      ),
    ],
  );
}

GoRouter initializeRouter() {
  return createRouter(RouterName.splashScreen);
}
