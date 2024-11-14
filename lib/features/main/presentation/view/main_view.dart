import 'package:e_commerce/core/theme/app_text_styles.dart';
import 'package:e_commerce/features/home/presentation/view/home_view.dart';
import 'package:flutter/material.dart';
import '../widgets/main_bottom_nav_bar.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _selectedIndex = 0;

  // قائمة الصفحات
  static final List<Widget> _widgetOptions = <Widget>[
    const HomeView(),
    Text('المنتجات', style: AppTextStyles.bodyXSmallRegular11),
    Text('سلة التسوق', style: AppTextStyles.bodyXSmallRegular11),
    Text('حسابي', style: AppTextStyles.bodyXSmallRegular11),
  ];

  // تغيير الصفحة عند الضغط
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: MainBottomNavBar(
        selectedIndex: _selectedIndex,
        onTabChange: _onItemTapped,
      ),
    );
  }
}
