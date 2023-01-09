import 'package:chiffa_control/pages/navigationbar.dart';
import 'package:chiffa_control/translation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import 'pages/Login/login_page.dart';
void main() {
  runApp(const MyApp());
}
enum Status { expired, notexpired }
Future<Status> checkToken() async {
  final pref = await SharedPreferences.getInstance();
  final String? token = pref.getString("token");

  if (token == null || token.isEmpty) {
    return Status.expired;
  }
  final expirationDate = JwtDecoder.getExpirationDate(token);

  if (DateTime.now().isAfter(expirationDate)) {
    return Status.expired;
  }

  return Status.notexpired;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) {
          return  GetMaterialApp(
                translations: TranslationScript(),
              debugShowCheckedModeBanner: false,
              locale: Get.deviceLocale,
              fallbackLocale: const Locale('en_US'),
            home: FutureBuilder(
                future: checkToken(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Container(
                        height: 100.h,
                        width: 100.w,
                        color: Colors.white,
                        child: const Center(
                            child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Color(0xff02227E)),
                        )));
                  }
                  if (snapshot.hasData) {
                    if (snapshot.data == Status.expired) {
                      return LoginPage(); //LandingPage();
                    }
                    return const NavBar();
                  }
                  return Container();
                },
              ),
          );
        });
  }
}
