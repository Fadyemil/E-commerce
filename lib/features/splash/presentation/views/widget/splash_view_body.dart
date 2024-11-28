// ignore_for_file: use_build_context_synchronously

import 'package:e_commerce/core/constants/constanst.dart';
import 'package:e_commerce/core/helper_functions/router/router_name.dart';
import 'package:e_commerce/core/services/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants/images.dart';

import 'package:intl/intl.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    _navigateAfterSplash();
    super.initState();
  }

  final isArabic = Intl.getCurrentLocale() == 'ar';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment:
              isArabic ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            SvgPicture.asset(Assets.imagePlant),
          ],
        ),
        SvgPicture.asset(Assets.imageLogo),
        SvgPicture.asset(
          Assets.imageSplashBottom,
          fit: BoxFit.fill,
        )
      ],
    );
  }

  Future<void> _navigateAfterSplash() async {
    await Future<dynamic>.delayed(const Duration(seconds: 3));

    CacheHelper prefs = CacheHelper();
    bool isBoarding = prefs.getData(key: kIsBoardingViewSeen) as bool? ?? false;
    bool isLogin = prefs.getData(key: kIsLigingViewSeen) as bool? ?? false;

    if (isLogin) {
      context.goNamed(RouterName.main_view);
    } else if (isBoarding) {
      context.goNamed(RouterName.login);
    } else {
      context.goNamed(RouterName.onBoarding);
    }
  }
}
