import 'package:e_commerce/core/helper_functions/router/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  final GoRouter router = initializeRouter();
  runApp(FruitHub(router: router));
}

class FruitHub extends StatelessWidget {
  const FruitHub({super.key, required this.router});

  final GoRouter router;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
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
