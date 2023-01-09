import 'dart:math';

import 'package:flutter/material.dart';


 

class CardBrdoFacture extends StatelessWidget {
  final String title;
  final String detail;
  const CardBrdoFacture({super.key, required this.title, required this.detail});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Text(
          title,
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Text(detail)
      ]),
    );
  }
}


  

