import 'package:e_commerce/core/constants/images.dart';
import 'package:flutter/material.dart';

class NoNetWorkScreen extends StatelessWidget {
  const NoNetWorkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.imageNoNetwork),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
