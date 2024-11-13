import 'package:e_commerce/core/constants/images.dart';
import 'package:e_commerce/core/theme/app_text_styles.dart';
import 'package:e_commerce/features/home/presentation/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    HomeView(),
    Text(
      'المنتجات',
      style: AppTextStyles.bodyXSmallRegular11,
    ),
    Text(
      'سلة التسوق',
      style: AppTextStyles.bodyXSmallRegular11,
    ),
    Text(
      'حسابي',
      style: AppTextStyles.bodyXSmallRegular11,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: Container(
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
              activeColor: Color(0xff1B5E37),
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[200]!,
              color: Colors.black,
              tabs: [
                GButton(
                  icon: LineIcons.home,
                  leading: SizedBox(
                    width: 24,
                    height: 24,
                    child: _selectedIndex == 0
                        ? SvgPicture.asset(
                            Assets.assetsImagesVuesaxBoldHome,
                            color: Color(0xff1B5E37),
                          )
                        : SvgPicture.asset(
                            Assets.assetsImagesVuesaxOutlineHome,
                          ),
                  ),
                  text: 'الرئيسية',
                  textStyle: AppTextStyles.bodyXSmallRegular11.copyWith(
                    color: Color(0xff1B5E37),
                  ),
                ),
                GButton(
                  icon: LineIcons.home,
                  leading: SizedBox(
                    width: 24,
                    height: 24,
                    child: _selectedIndex == 1
                        ? SvgPicture.asset(
                            Assets.assetsImagesVuesaxBoldProducts,
                            color: Color(0xff1B5E37),
                          )
                        : SvgPicture.asset(
                            Assets.assetsImagesVuesaxOutlineProducts,
                          ),
                  ),
                  text: 'المنتجات',
                  textStyle: AppTextStyles.bodyXSmallRegular11.copyWith(
                    color: Color(0xff1B5E37),
                  ),
                ),
                GButton(
                  icon: LineIcons.home,
                  leading: SizedBox(
                    width: 24,
                    height: 24,
                    child: _selectedIndex == 2
                        ? SvgPicture.asset(
                            Assets.assetsImagesVuesaxBoldShoppingCart,
                            color: Color(0xff1B5E37),
                          )
                        : SvgPicture.asset(
                            Assets.assetsImagesVuesaxOutlineShoppingCart,
                          ),
                  ),
                  text: 'سلة التسوق',
                  textStyle: AppTextStyles.bodyXSmallRegular11.copyWith(
                    color: Color(0xff1B5E37),
                  ),
                ),
                GButton(
                  icon: LineIcons.home,
                  leading: SizedBox(
                    width: 24,
                    height: 24,
                    child: _selectedIndex == 3
                        ? SvgPicture.asset(
                            Assets.assetsImagesVuesaxBoldUser,
                            color: Color(0xff1B5E37),
                          )
                        : SvgPicture.asset(
                            Assets.assetsImagesVuesaxOutlineUser,
                          ),
                  ),
                  text: _selectedIndex == 3 ? 'حسابي' : '',
                  textStyle: AppTextStyles.bodyXSmallRegular11.copyWith(
                    color: Color(0xff1B5E37),
                  ),
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
