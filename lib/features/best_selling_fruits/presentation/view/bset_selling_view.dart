import 'package:e_commerce/features/best_selling_fruits/presentation/view/widget/best_selling_view_body.dart';
import 'package:flutter/material.dart';
import '../../../../core/widget/build_app_bar.dart';

class BsetSellingView extends StatelessWidget {
  const BsetSellingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BuildAppBar(context, 'الأكثر مبيعًا'),
      body: BestSellingViewBody(),
    );
  }
}
