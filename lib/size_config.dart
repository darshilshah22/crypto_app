import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  static double? blockSizeHorizontal;
  static double? blockSizeVertical;
  static double? _safeAreaHorizontal;
  static double? _safeAreaVertical;
  static double? safeBlockHorizontal;
  static double? safeBlockVertical;
  static double? newSize;
  static double? scaleFactor;
  static double? fontScale;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData!.size.width;
    screenHeight = _mediaQueryData!.size.height;
    blockSizeHorizontal = screenWidth! / 100;
    blockSizeVertical = screenHeight! / 100;
    _safeAreaHorizontal =
        _mediaQueryData!.padding.left + _mediaQueryData!.padding.right;
    _safeAreaVertical =
        _mediaQueryData!.padding.top + _mediaQueryData!.padding.bottom;
    safeBlockHorizontal = (screenWidth! - _safeAreaHorizontal!) / 100;
    safeBlockVertical = (screenHeight! - _safeAreaVertical!) / 100;
    scaleFactor = _mediaQueryData!.textScaleFactor;
    fontScale = (screenWidth! / 3) / 100;
  }

  static double responsiveSize(double size) {
    return size / scaleFactor!;
  }
}

//===============================Height==========================================

double h0 = 0.0 * SizeConfig.blockSizeVertical!;
double h0_1 = 0.1 * SizeConfig.blockSizeVertical!;
double h0_2 = 0.2 * SizeConfig.blockSizeVertical!;
double h0_3 = 0.3 * SizeConfig.blockSizeVertical!;
double h0_5 = 0.5 * SizeConfig.blockSizeVertical!;
double h0_7 = 0.7 * SizeConfig.blockSizeVertical!;
double h1 = 1.0 * SizeConfig.blockSizeVertical!;
double h1_5 = 1.5 * SizeConfig.blockSizeVertical!;
double h1_7 = 1.7 * SizeConfig.blockSizeVertical!;
double h1_8 = 1.8 * SizeConfig.blockSizeVertical!;
double h2 = 2.0 * SizeConfig.blockSizeVertical!;
double h2_4 = 2.4 * SizeConfig.blockSizeVertical!;
double h2_5 = 2.5 * SizeConfig.blockSizeVertical!;
double h3 = 3.0 * SizeConfig.blockSizeVertical!;
double h3_5 = 3.5 * SizeConfig.blockSizeVertical!;
double h4 = 4.0 * SizeConfig.blockSizeVertical!;
double h4_2 = 4.2 * SizeConfig.blockSizeVertical!;
double h4_5 = 4.5 * SizeConfig.blockSizeVertical!;
double h5 = 5.0 * SizeConfig.blockSizeVertical!;
double h6 = 6.0 * SizeConfig.blockSizeVertical!;
double h6_5 = 6.5 * SizeConfig.blockSizeVertical!;
double h7 = 7.0 * SizeConfig.blockSizeVertical!;
double h7_5 = 7.5 * SizeConfig.blockSizeVertical!;
double h8 = 8.0 * SizeConfig.blockSizeVertical!;
double h9 = 9.0 * SizeConfig.blockSizeVertical!;
double h10 = 10.0 * SizeConfig.blockSizeVertical!;
double h11 = 11.0 * SizeConfig.blockSizeVertical!;
double h12 = 12.0 * SizeConfig.blockSizeVertical!;
double h13 = 13.0 * SizeConfig.blockSizeVertical!;
double h14 = 14.0 * SizeConfig.blockSizeVertical!;
double h15 = 15.0 * SizeConfig.blockSizeVertical!;
double h16 = 16.0 * SizeConfig.blockSizeVertical!;
double h17 = 17.0 * SizeConfig.blockSizeVertical!;
double h18 = 18.0 * SizeConfig.blockSizeVertical!;
double h19 = 19.0 * SizeConfig.blockSizeVertical!;
double h20 = 20.0 * SizeConfig.blockSizeVertical!;
double h21 = 21.0 * SizeConfig.blockSizeVertical!;
double h23 = 23.0 * SizeConfig.blockSizeVertical!;
double h25 = 25.0 * SizeConfig.blockSizeVertical!;
double h28 = 28.0 * SizeConfig.blockSizeVertical!;
double h28_5 = 28.5 * SizeConfig.blockSizeVertical!;
double h30 = 30.0 * SizeConfig.blockSizeVertical!;
double h30_5 = 30.5 * SizeConfig.blockSizeVertical!;
double h32 = 32.0 * SizeConfig.blockSizeVertical!;
double h33 = 33.0 * SizeConfig.blockSizeVertical!;
double h35 = 35.0 * SizeConfig.blockSizeVertical!;
double h36 = 36.0 * SizeConfig.blockSizeVertical!;
double h40 = 40.0 * SizeConfig.blockSizeVertical!;
double h45 = 45.0 * SizeConfig.blockSizeVertical!;
double h50 = 50.0 * SizeConfig.blockSizeVertical!;
double h52 = 52.0 * SizeConfig.blockSizeVertical!;
double h55 = 55.0 * SizeConfig.blockSizeVertical!;
double h57 = 57.0 * SizeConfig.blockSizeVertical!;
double h59 = 59.0 * SizeConfig.blockSizeVertical!;
double h60 = 60.0 * SizeConfig.blockSizeVertical!;
double h64 = 64.0 * SizeConfig.blockSizeVertical!;
double h67 = 67.0 * SizeConfig.blockSizeVertical!;
double h70 = 70.0 * SizeConfig.blockSizeVertical!;
double h75 = 75.0 * SizeConfig.blockSizeVertical!;
double h80 = 80.0 * SizeConfig.blockSizeVertical!;
double h100 = 100.0 * SizeConfig.blockSizeVertical!;
double h150 = 150.0 * SizeConfig.blockSizeVertical!;

//==================================Width===========================================
double w0 = 0.0 * SizeConfig.blockSizeHorizontal!;
double w0_3 = 0.3 * SizeConfig.blockSizeHorizontal!;
double w0_5 = 0.5 * SizeConfig.blockSizeHorizontal!;
double w0_8 = 0.8 * SizeConfig.blockSizeHorizontal!;
double w1 = 1.0 * SizeConfig.blockSizeHorizontal!;
double w1_5 = 1.5 * SizeConfig.blockSizeHorizontal!;
double w1_8 = 1.8 * SizeConfig.blockSizeHorizontal!;
double w2 = 2.0 * SizeConfig.blockSizeHorizontal!;
double w2_5 = 2.5 * SizeConfig.blockSizeHorizontal!;
double w3 = 3.0 * SizeConfig.blockSizeHorizontal!;
double w3_5 = 3.5 * SizeConfig.blockSizeHorizontal!;
double w4 = 4.0 * SizeConfig.blockSizeHorizontal!;
double w4_5 = 4.5 * SizeConfig.blockSizeHorizontal!;
double w5 = 5.0 * SizeConfig.blockSizeHorizontal!;
double w6 = 6.0 * SizeConfig.blockSizeHorizontal!;
double w6_5 = 6.5 * SizeConfig.blockSizeHorizontal!;
double w7 = 7.0 * SizeConfig.blockSizeHorizontal!;
double w7_5 = 7.5 * SizeConfig.blockSizeHorizontal!;
double w8 = 8.0 * SizeConfig.blockSizeHorizontal!;
double w8_5 = 8.5 * SizeConfig.blockSizeHorizontal!;
double w9 = 9.0 * SizeConfig.blockSizeHorizontal!;
double w10 = 10.0 * SizeConfig.blockSizeHorizontal!;
double w12 = 12.0 * SizeConfig.blockSizeHorizontal!;
double w13 = 13.0 * SizeConfig.blockSizeHorizontal!;
double w14 = 14.0 * SizeConfig.blockSizeHorizontal!;
double w15 = 15.0 * SizeConfig.blockSizeHorizontal!;
double w16 = 16.0 * SizeConfig.blockSizeHorizontal!;
double w17 = 17.0 * SizeConfig.blockSizeHorizontal!;
double w18 = 18.0 * SizeConfig.blockSizeHorizontal!;
double w19 = 19.0 * SizeConfig.blockSizeHorizontal!;
double w20 = 20.0 * SizeConfig.blockSizeHorizontal!;
double w22 = 22.0 * SizeConfig.blockSizeHorizontal!;
double w23 = 23.0 * SizeConfig.blockSizeHorizontal!;
double w25 = 25.0 * SizeConfig.blockSizeHorizontal!;
double w27 = 27.0 * SizeConfig.blockSizeHorizontal!;
double w30 = 30.0 * SizeConfig.blockSizeHorizontal!;
double w32 = 32.0 * SizeConfig.blockSizeHorizontal!;
double w35 = 35.0 * SizeConfig.blockSizeHorizontal!;
double w37 = 37.0 * SizeConfig.blockSizeHorizontal!;
double w38 = 38.0 * SizeConfig.blockSizeHorizontal!;
double w40 = 40.0 * SizeConfig.blockSizeHorizontal!;
double w45 = 45.0 * SizeConfig.blockSizeHorizontal!;
double w50 = 50.0 * SizeConfig.blockSizeHorizontal!;
double w55 = 55.0 * SizeConfig.blockSizeHorizontal!;
double w60 = 60.0 * SizeConfig.blockSizeHorizontal!;
double w70 = 70.0 * SizeConfig.blockSizeHorizontal!;
double w100 = 100.0 * SizeConfig.blockSizeHorizontal!;
double w150 = 150.0 * SizeConfig.blockSizeHorizontal!;

//================================Font Size=============================

double f0 = 0.0 * SizeConfig.fontScale!;
double f0_5 = 0.5 * SizeConfig.fontScale!;
double f1 = 1.0 * SizeConfig.fontScale!;
double f1_5 = 1.5 * SizeConfig.fontScale!;
double f2 = 2.0 * SizeConfig.fontScale!;
double f2_5 = 2.5 * SizeConfig.fontScale!;
double f3 = 3.0 * SizeConfig.fontScale!;
double f3_5 = 3.5 * SizeConfig.fontScale!;
double f4 = 4.0 * SizeConfig.fontScale!;
double f5 = 5.0 * SizeConfig.fontScale!;
double f6 = 6.0 * SizeConfig.fontScale!;
double f7 = 7.0 * SizeConfig.fontScale!;
double f8 = 8.0 * SizeConfig.fontScale!;
double f8_5 = 8.5 * SizeConfig.fontScale!;
double f9 = 9.0 * SizeConfig.fontScale!;
double f9_5 = 9.5 * SizeConfig.fontScale!;
double f10 = 10.0 * SizeConfig.fontScale!;
double f11 = 11.0 * SizeConfig.fontScale!;
double f11_5 = 11.5 * SizeConfig.fontScale!;
double f12 = 12.0 * SizeConfig.fontScale!;
double f12_5 = 12.5 * SizeConfig.fontScale!;
double f13 = 13.0 * SizeConfig.fontScale!;
double f14 = 14.0 * SizeConfig.fontScale!;
double f15 = 15.0 * SizeConfig.fontScale!;
double f16 = 16.0 * SizeConfig.fontScale!;
double f17 = 17.0 * SizeConfig.fontScale!;
double f20 = 20.0 * SizeConfig.fontScale!;
double f22 = 22.0 * SizeConfig.fontScale!;
double f25 = 25.0 * SizeConfig.fontScale!;
double f30 = 30.0 * SizeConfig.fontScale!;
double f30_5 = 30.5 * SizeConfig.fontScale!;
double f35 = 35.0 * SizeConfig.fontScale!;
double f40 = 40.0 * SizeConfig.fontScale!;
double f45 = 45.0 * SizeConfig.fontScale!;
double f50 = 50.0 * SizeConfig.fontScale!;

//========================================Elevation==============================
double e1 = 1.0;
double e2 = 2.0;
double e3 = 3.0;
double e4 = 4.0;
double e5 = 5.0;
double e6 = 6.0;
double e7 = 7.0;
double e10 = 10.0;
double e15 = 15.0;
double e20 = 20.0;
double e25 = 25.0;
double e30 = 30.0;
