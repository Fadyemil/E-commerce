import 'package:e_commerce/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class TitleTextPageOne extends StatelessWidget {
  const TitleTextPageOne({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: 'مرحبًا بك في', style: AppTextStyles.heading23Bold),
          TextSpan(text: ' Fruit', style: AppTextStyles.heading23Bold),
          TextSpan(
              text: 'HUB',
              style: AppTextStyles.heading23Bold.copyWith(color: Colors.amber)),
        ],
      ),
    );
  }
}
