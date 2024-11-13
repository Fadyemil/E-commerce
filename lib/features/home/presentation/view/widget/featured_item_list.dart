import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'featured_item.dart';

class FeaturedItemList extends StatelessWidget {
  const FeaturedItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: 5,
      itemBuilder: (context, index, realIndex) {
        return FeaturedItem();
      },
      options: CarouselOptions(
        aspectRatio: 342 / 165,
        viewportFraction: 0.843,
        enableInfiniteScroll: false,
        enlargeCenterPage: true,
        autoPlay: true,
      ),
    );
  }
}
