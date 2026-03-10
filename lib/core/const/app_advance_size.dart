import 'package:flutter/material.dart';

/// Device Types
enum DeviceType { mobile, tablet, desktop }

/// Screen Breakpoints
class Breakpoints {
  static const double mobile = 600;
  static const double tablet = 900;
  static const double desktop = 1200;
}

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double blockSizeHorizontal;
  static late double blockSizeVertical;
  static late double safeBlockHorizontal;
  static late double safeBlockVertical;
  static late Orientation orientation;
  static late DeviceType deviceType;

  // Figma Design Base Size
  static const double figmaWidth = 375.0;  
  static const double figmaHeight = 812.0; 

  /// Initialize SizeConfig
  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;

    // Block size calculation
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;

    // Safe area calculation
    double safeAreaHorizontal = _mediaQueryData.padding.left + 
                                _mediaQueryData.padding.right;
    double safeAreaVertical = _mediaQueryData.padding.top + 
                              _mediaQueryData.padding.bottom;

    safeBlockHorizontal = (screenWidth - safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight - safeAreaVertical) / 100;

    // Device type detection
    deviceType = _getDeviceType();
  }

  /// Get Device Type
  static DeviceType _getDeviceType() {
    if (screenWidth < Breakpoints.mobile) {
      return DeviceType.mobile;
    } else if (screenWidth < Breakpoints.tablet) {
      return DeviceType.tablet;
    } else {
      return DeviceType.desktop;
    }
  }

  /// Responsive Width based on Figma
  static double getWidth(double figmaWidth) {
    return (figmaWidth / SizeConfig.figmaWidth) * screenWidth;
  }

  /// Responsive Height based on Figma
  static double getHeight(double figmaHeight) {
    return (figmaHeight / SizeConfig.figmaHeight) * screenHeight;
  }

  /// Responsive Font Size
  static double getFont(double figmaFontSize) {
    double scaleFactor = screenWidth / figmaWidth;
    
    // Device-based font scaling
    if (deviceType == DeviceType.tablet) {
      scaleFactor *= 1.2; // Tablet এ একটু বড়
    } else if (deviceType == DeviceType.desktop) {
      scaleFactor *= 1.4; // Desktop এ আরো বড়
    }
    
    return figmaFontSize * scaleFactor;
  }

  /// Responsive Size (padding, margin, radius)
  static double getSize(double size) {
    return (size / figmaWidth) * screenWidth;
  }

  /// Screen Percentage
  static double widthPercent(double percent) => screenWidth * (percent / 100);
  static double heightPercent(double percent) => screenHeight * (percent / 100);

  /// Safe Area Percentage
  static double safeWidthPercent(double percent) => 
      safeBlockHorizontal * percent;
  static double safeHeightPercent(double percent) => 
      safeBlockVertical * percent;

  /// Device Type Checks
  static bool get isMobile => deviceType == DeviceType.mobile;
  static bool get isTablet => deviceType == DeviceType.tablet;
  static bool get isDesktop => deviceType == DeviceType.desktop;
  static bool get isPortrait => orientation == Orientation.portrait;
  static bool get isLandscape => orientation == Orientation.landscape;

  /// Responsive value based on device type
  static T responsiveValue<T>({
    required T mobile,
    T? tablet,
    T? desktop,
  }) {
    if (isDesktop && desktop != null) return desktop;
    if (isTablet && tablet != null) return tablet;
    return mobile;
  }

  /// Get appropriate column count
  static int getColumnCount({
    int mobile = 1,
    int tablet = 2,
    int desktop = 3,
  }) {
    return responsiveValue(
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
    );
  }

  /// Get appropriate cross axis count for GridView
  static int getCrossAxisCount({
    int mobile = 2,
    int tablet = 3,
    int desktop = 4,
  }) {
    return responsiveValue(
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
    );
  }
}

/// Extension for easier responsive sizing
extension ResponsiveSize on num {
  /// Width
  double get w => SizeConfig.getWidth(toDouble());
  
  /// Height
  double get h => SizeConfig.getHeight(toDouble());
  
  /// Font Size
  double get sp => SizeConfig.getFont(toDouble());
  
  /// General Size (padding, margin, radius)
  double get r => SizeConfig.getSize(toDouble());
  
  /// Width Percentage
  double get wp => SizeConfig.widthPercent(toDouble());
  
  /// Height Percentage
  double get hp => SizeConfig.heightPercent(toDouble());
  
  /// Safe Width Percentage
  double get swp => SizeConfig.safeWidthPercent(toDouble());
  
  /// Safe Height Percentage
  double get shp => SizeConfig.safeHeightPercent(toDouble());
}