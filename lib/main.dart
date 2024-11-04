import 'package:device_preview/device_preview.dart';
import 'package:e_commerce/core/helper_functions/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';

import 'generated/l10n.dart';

void main() {
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

class FruitHub extends StatelessWidget {
  const FruitHub({super.key, required this.router});

  final GoRouter router;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: const Locale('ar'),
      title: 'Fruites Hub',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}
