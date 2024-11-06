import 'package:e_commerce/core/constants/images.dart';
import 'package:e_commerce/core/theme/app_text_styles.dart';
import 'package:e_commerce/features/on_boarding/presentation/view/widget/title_text_page_one.dart';
import 'package:flutter/material.dart';

import 'page_view_item.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({
    super.key,
    required this.controller,
  });
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      children: [
        const PageViewItem(
          visible: true,
          title: TitleTextPageOne(),
          subtitle:
              'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',
          backgroundImage: Assets.assetsImagesPageViewItem1BackgroundImage,
          image: Assets.assetsImagesPageViewItem1Image,
        ),
        PageViewItem(
          visible: false,
          title: Text(
            'ابحث وتسوق',
            style: AppTextStyles.heading23Bold,
          ),
          subtitle:
              'نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية',
          backgroundImage: Assets.assetsImagesPageViewItem2BackgroundImage,
          image: Assets.assetsImagesPageViewItem2Image,
        )
      ],
    );
  }
}
