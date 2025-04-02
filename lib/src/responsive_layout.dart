import 'package:flutter/widgets.dart';

/// Main class with responsive layout functionality
class ResponsiveLayout {
  /// Screen width breakpoint for mobile devices
  static const double mobileBreakpoint = 480;

  /// Screen width breakpoint for tablet devices
  static const double tabletBreakpoint = 768;

  /// Screen width breakpoint for desktop devices
  static const double desktopBreakpoint = 1200;

  /// Base width used for calculating relative sizes
  static const double baseWidth = 375.0; // iPhone X width

  /// Base height used for calculating relative sizes
  static const double baseHeight = 812.0; // iPhone X height

  /// Check if current screen size is mobile
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < mobileBreakpoint;

  /// Check if current screen size is tablet
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= mobileBreakpoint &&
          MediaQuery.of(context).size.width < tabletBreakpoint;

  /// Check if current screen size is desktop
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= desktopBreakpoint;

  /// Calculate width relative to the base width
  static double relativeWidth(double width, BuildContext context) =>
      width / baseWidth * MediaQuery.of(context).size.width;

  /// Calculate height relative to the base height
  static double relativeHeight(double height, BuildContext context) =>
      height / baseHeight * MediaQuery.of(context).size.height;

  /// Calculate font size relative to the screen size
  static double fontSize(double size, BuildContext context) {
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;
    final width = MediaQuery.of(context).size.width;
    final scaleFactor = (width / baseWidth).clamp(0.8, 1.4);
    return size * scaleFactor * textScaleFactor;
  }
}
