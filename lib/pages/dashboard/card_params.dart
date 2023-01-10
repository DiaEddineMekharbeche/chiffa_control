import 'package:chiffa_control/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardParms extends StatelessWidget {
  final String title;
  final Icon;

  const CardParms({super.key, required this.title,required this.Icon});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
         side: const BorderSide(
      color: primaryColor,
      width: 2, 
    ),
        borderRadius: BorderRadius.circular(20.0),
        
      ),
        color: primaryColorDeep,
        child: Column(
          
           
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(title,style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
              
              const SizedBox(height: 10,),
              Image.asset(
              Icon,
              height: 100.h,)
            ]));
  }
}
