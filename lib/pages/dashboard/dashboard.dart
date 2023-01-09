
import 'package:chiffa_control/constants.dart';

import 'package:chiffa_control/pages/dashboard/card_bordro_facture.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    var list = ['ahmed', 'maher', 'hichem'];
    var discription = ['teste klk chose','alors ','bbbbbbbbbbbbbbbbbbbbbb'];

    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      body: SafeArea(
          child: Column(
        children: [
          // appbar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // name
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'hello,',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    const Text(
                      'Ahmed Guessoum',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                  ],
                ),
                //  profil photo
                Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color:primaryColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.person)),
              ],
            ),
          ),

          SizedBox(
            height: 60.h,
          ),

          // card

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Material(
              elevation: 5,
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // animation photo

                    SizedBox(
                      height: 100.h,
                      width: 100.w,
                      child: Image.asset(
                        'assets/images/pharmacielogo.png',
                      ),
                    ),

                    // text card

                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const CardBrdoFacture(
                            title: "FACTURES",
                            detail: "80",
                          ),
                          SizedBox(
                            width: 25.w,
                          ),
                          const CardBrdoFacture(
                            title: "BORDEREAU",
                            detail: "22",
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
         
        ],
      )),
    );
  }
}
