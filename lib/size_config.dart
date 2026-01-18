import 'package:flutter/material.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double pixelRatio;
  static late Orientation orientation;
  static late bool isTablet;
  static late bool isMobile;

 
  static const double designWidth = 360.0;
  static const double designHeight = 690.0;

  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
    pixelRatio = _mediaQueryData.devicePixelRatio;

   
    isTablet = screenWidth >= 600;
    isMobile = screenWidth < 600;
  }
}

extension ResponsiveExtension on num {
 
  double get w => (this / SizeConfig.designWidth) * SizeConfig.screenWidth;

  
  double get h => (this / SizeConfig.designHeight) * SizeConfig.screenHeight;

  
  double get sp {
    double scale = SizeConfig.screenWidth / SizeConfig.designWidth;
    return this * scale;
  }
}
