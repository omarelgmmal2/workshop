import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/design/app_image.dart';
import '../../core/utils/app_color.dart';
import '../../core/utils/assets.dart';
import '../pages/account/my_account_page.dart';
import '../pages/main/main_page.dart';
import '../pages/notification/notification_page.dart';
import '../pages/order/my_orders_page.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  int currentIndex = 0;

  List<Widget> pages = [
    MainPage(),
    NotificationPage(),
    MyOrdersPage(),
    MyAccountPage(),
  ];

  List<String> titles = [
    "Main",
    "Notification",
    "Order",
    "Account",
  ];

  List<String> icons = [
    AppImages.home,
    AppImages.notification,
    AppImages.orders,
    AppImages.account,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: AppColor.primary,
              width: 0.5,
            ),
          ),
        ),
        child: BottomNavigationBar(
          onTap: (value) {
            currentIndex = value;
            setState(() {});
          },
          backgroundColor: AppColor.white,
          selectedItemColor: Color(0xffC0FFDA),
          unselectedItemColor: AppColor.black,
          selectedFontSize: 10.sp,
          unselectedFontSize: 10.sp,
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          items: List.generate(
            pages.length,
                (index) => BottomNavigationBarItem(
              icon: AppImage(
                icons[index],
                height: 28.h,
                width: 28.h,
                color: currentIndex == index
                    ? Color(0xffC0FFDA)
                    : AppColor.primary,
              ),
              label: titles[index],
            ),
          ),
        ),
      ),
    );
  }
}
