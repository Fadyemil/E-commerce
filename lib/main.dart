import 'package:e_commerce/core/app/connectivity_controller.dart';
import 'package:e_commerce/core/widget/no_network_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'generated/l10n.dart';

class FruitHub extends StatelessWidget {
  const FruitHub({super.key, required this.router});

  final GoRouter router;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: ConnectivityController.instance.isConnected,
      builder: (context, isConnected, child) {
        return isConnected ? _buildApp(context) : _buildNoNetworkScreen();
      },
    );
  }

  // Builds the app when there's a network connection
  Widget _buildApp(BuildContext context) {
    const languageCode = 'ar';
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp.router(
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        locale: Locale(languageCode),
        title: 'Fruit Hub',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          fontFamily: _getFontFamily(languageCode),
        ),
        builder: (context, child) {
          ConnectivityController.instance.init();
          return Scaffold(
            body: child!,
          );
        },
        routerConfig: router,
      ),
    );
  }

  String _getFontFamily(String Lang) {
    return Lang == 'ar' ? 'Cairo' : 'Poppins';
  }

  // Builds the no-network screen when there's no connection
  Widget _buildNoNetworkScreen() {
    return const MaterialApp(
      title: 'No Network',
      debugShowCheckedModeBanner: false,
      home: NoNetWorkScreen(),
    );
  }
}
