import 'package:e_commerce/core/helper_functions/router/router_name.dart';
import 'package:e_commerce/features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

GoRouter createRouter(String initialLocation) {
  return GoRouter(
    initialLocation: initialLocation,
    routes: [
      GoRoute(
        path: RouterName.splashScreen,
        builder: (context, state) => const SplashView(),
      ),
    ],
  );
}

GoRouter initializeRouter() {
  return createRouter(RouterName.splashScreen);
}
