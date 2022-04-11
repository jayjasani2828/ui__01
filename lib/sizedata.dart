import 'package:flutter/material.dart';

class sizedata {
  static double? width, height, stheight, btheight, appheight, bodyheight;

  sizedata(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    stheight = MediaQuery.of(context).padding.top;
    btheight = MediaQuery.of(context).padding.bottom;
    appheight = kToolbarHeight;

    bodyheight = height! - stheight! - btheight!;
  }
}

class AppColor {
  static var darkGrey = Color(0xff363636);
  static var primaryColor = Color(0xff976AA4);
  static var greyColor = Color(0xff707070);
}

class Apimail{
  static var farahmail = "http://merbed.org/farah/public/api/";
}