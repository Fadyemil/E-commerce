import 'package:flutter/material.dart';

void main() {
  runApp(const MainDashsBoard());
}

class MainDashsBoard extends StatelessWidget {
  const MainDashsBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fruit Hub'),
        ),
        body: const Center(
          child: Text('Main Dashs Board'),
        ),
      ),
    );
  }
}
