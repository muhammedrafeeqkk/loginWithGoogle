 import 'dart:ui';

import 'package:flutter/cupertino.dart';

Container googleIcon(double screenHeight, double screenwidth) {
    return Container(
                height: screenHeight * 0.1,
                width: screenwidth * 0.1,
                child: Image.asset(
                  "assets/Google - Original.png",
                  fit: BoxFit.contain,
                ));
  }


   SizedBox constSizedBox7() {
    return SizedBox(
      height: 7,
    );
  }

  Text DetailText(
      {required String title,
      required Color color,
      required FontWeight fontweight,
      required double size}) {
    return Text(title,
        style: TextStyle(color: color, fontWeight: fontweight, fontSize: size));
  }