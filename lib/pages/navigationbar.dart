import 'package:chiffa_control/constants.dart';
import 'package:chiffa_control/pages/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}
 int currentindex = 0;
class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        body: IndexedStack(
          index: currentindex,
          children: [
          Dashboard(),
            Text ('second page'),
            Text ('third page'),
            Text ('fourd  page'),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: 15,
          color: Colors.grey.withOpacity(0.5),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: primaryColor,
            selectedItemColor: secondryColor,
            unselectedItemColor: Colors.grey.withOpacity(0.9),
            showSelectedLabels: false,
            showUnselectedLabels: false,
            iconSize: 30.h,
            currentIndex: currentindex,
            onTap: (int index) {
              setState(() {
                currentindex = index;
                if (currentindex == 2) {
                 
                }
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/images/Home.png',
                  color: Colors.white,height: 30.h,width: 30.w,
                ),
                activeIcon: Image.asset('assets/images/Home.png',height: 30.h,width: 30.w,
                    color: textblackColor),
                label: 'acceuil'.tr,
              ),
              BottomNavigationBarItem(
                icon: Image.asset('assets/images/Link.png',height: 30.h,width: 30.w,
                    color: const Color(0xffFFFFFF)),
                activeIcon: Image.asset('assets/images/Link.png',height: 30.h,width: 30.w,
                    color:textblackColor),
                label: 'appareils'.tr,
              ),
              BottomNavigationBarItem(
                icon: Image.asset('assets/images/Calendar.png',height: 30.h,width: 30.w,
                    color: const Color(0xffFFFFFF)),
                activeIcon: Image.asset('assets/images/Calendar.png',height: 30.h,width: 30.w,
                    color: textblackColor),
                label: 'rendez-vous',
              ),
              BottomNavigationBarItem(
                icon: Image.asset('assets/images/Profile.png',height: 30.h,width: 30.w,
                    color: const Color(0xffFFFFFF)),
                activeIcon: Image.asset('assets/images/Profile.png',height: 30.h,width: 30.w,
                    color: textblackColor),
                label: 'profil'.tr,
              ),
            ],
          ),
        ));
  }
}