import 'package:e_commerce/core/constants/images.dart';
import 'package:e_commerce/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MainBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabChange;

  const MainBottomNavBar({
    Key? key,
    required this.selectedIndex,
    required this.onTabChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            color: Colors.black.withOpacity(.1),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r),
          topRight: Radius.circular(30.r),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
          child: GNav(
            rippleColor: Colors.grey[300]!,
            hoverColor: Colors.grey[100]!,
            gap: 8,
            activeColor: const Color(0xff1B5E37),
            iconSize: 24,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            duration: const Duration(milliseconds: 400),
            tabBackgroundColor: Colors.grey[200]!,
            color: Colors.black,
            tabs: [
              _buildGButton(
                selectedIndex == 0,
                'الرئيسية',
                Assets.assetsImagesVuesaxBoldHome,
                Assets.assetsImagesVuesaxOutlineHome,
              ),
              _buildGButton(
                selectedIndex == 1,
                'المنتجات',
                Assets.assetsImagesVuesaxBoldProducts,
                Assets.assetsImagesVuesaxOutlineProducts,
              ),
              _buildGButton(
                selectedIndex == 2,
                'سلة التسوق',
                Assets.assetsImagesVuesaxBoldShoppingCart,
                Assets.assetsImagesVuesaxOutlineShoppingCart,
              ),
              _buildGButton(
                selectedIndex == 3,
                'حسابي',
                Assets.assetsImagesVuesaxBoldUser,
                Assets.assetsImagesVuesaxOutlineUser,
              ),
            ],
            selectedIndex: selectedIndex,
            onTabChange: onTabChange,
          ),
        ),
      ),
    );
  }

  // دالة لإنشاء زر GButton
  GButton _buildGButton(bool isSelected, String text, String boldIcon, String outlineIcon) {
    return GButton(
      icon: Icons.home,
      leading: SizedBox(
        width: 24,
        height: 24,
        child: SvgPicture.asset(
          isSelected ? boldIcon : outlineIcon,
          color: isSelected ? const Color(0xff1B5E37) : null,
        ),
      ),
      text: text,
      textStyle: AppTextStyles.bodyXSmallRegular11.copyWith(
        color: const Color(0xff1B5E37),
      ),
    );
  }
}
