import 'package:e_commerce/features/home/presentation/view/widget/custom_search.dart';
import 'package:e_commerce/features/home/presentation/view/widget/cutsom_home_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              SizedBox(height: 16.h),
              CutsomHomeAppBar(),
              SizedBox(height: 16.h),
              CustomSearch(),
            ],
          ),
        ),
      ],
    );
  }
}
