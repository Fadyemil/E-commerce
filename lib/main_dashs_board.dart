import 'package:e_commerce/desh_board/presentation/view/desh_board_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainDashsBoard());
}

class MainDashsBoard extends StatelessWidget {
  const MainDashsBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DeshBoardView(),
    );
  }
}
