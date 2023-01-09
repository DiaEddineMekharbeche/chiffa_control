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
        backgroundColor: Colors.white,
        body: IndexedStack(
          index: currentindex,
          children: const[
           Text('Dashboard'),
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
            backgroundColor: const Color(0xff2954E7),
            selectedItemColor: const Color(0xffF2C94C),
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
                    color: const Color(0xffF2C94C)),
                label: 'acceuil'.tr,
              ),
              BottomNavigationBarItem(
                icon: Image.asset('assets/images/Link.png',height: 30.h,width: 30.w,
                    color: const Color(0xffFFFFFF)),
                activeIcon: Image.asset('assets/images/Link.png',height: 30.h,width: 30.w,
                    color: const Color(0xffF2C94C)),
                label: 'appareils'.tr,
              ),
              BottomNavigationBarItem(
                icon: Image.asset('assets/images/Calendar.png',height: 30.h,width: 30.w,
                    color: const Color(0xffFFFFFF)),
                activeIcon: Image.asset('assets/images/Calendar.png',height: 30.h,width: 30.w,
                    color: const Color(0xffF2C94C)),
                label: 'rendez-vous',
              ),
              BottomNavigationBarItem(
                icon: Image.asset('assets/images/Profile.png',height: 30.h,width: 30.w,
                    color: const Color(0xffFFFFFF)),
                activeIcon: Image.asset('assets/images/Profile.png',height: 30.h,width: 30.w,
                    color: const Color(0xffF2C94C)),
                label: 'profil'.tr,
              ),
            ],
          ),
        ));
  }
}