// File: lib/src/responsive_provider.dart
import 'package:flutter/widgets.dart';
import 'responsive_builder.dart';
import 'responsive_layout.dart';

/// Data class to store responsive information
class ResponsiveData {
  /// Current screen type
  final ScreenType screenType;

  /// Screen width
  final double screenWidth;

  /// Screen height
  final double screenHeight;

  /// Font scale factor
  final double fontScaleFactor;

  /// Width scale factor relative to base width
  final double widthScaleFactor;

  /// Height scale factor relative to base height
  final double heightScaleFactor;

  /// Text scale factor from system settings
  final double textScaleFactor;

  /// Constructor
  ResponsiveData({
    required this.screenType,
    required this.screenWidth,
    required this.screenHeight,
    required this.fontScaleFactor,
    required this.widthScaleFactor,
    required this.heightScaleFactor,
    required this.textScaleFactor,
  });
}

/// Provider widget that caches responsive calculations
class ResponsiveProvider extends InheritedWidget {
  /// Responsive data
  final ResponsiveData data;

  /// Constructor
  const ResponsiveProvider({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  /// Get the provider from context
  static ResponsiveData of(BuildContext context) {
    final provider = context.dependOnInheritedWidgetOfExactType<ResponsiveProvider>();
    assert(provider != null, 'No ResponsiveProvider found in context');
    return provider!.data;
  }

  /// Get the provider from context safely
  static ResponsiveData? maybeOf(BuildContext context) {
    final provider = context.dependOnInheritedWidgetOfExactType<ResponsiveProvider>();
    return provider?.data;
  }

  @override
  bool updateShouldNotify(ResponsiveProvider oldWidget) {
    return data.screenWidth != oldWidget.data.screenWidth ||
        data.screenHeight != oldWidget.data.screenHeight ||
        data.textScaleFactor != oldWidget.data.textScaleFactor;
  }
}

/// Root widget that provides responsive calculations to the entire app
class ResponsiveApp extends StatelessWidget {
  /// Child widget
  final Widget child;

  /// Constructor
  const ResponsiveApp({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final mediaQuery = MediaQuery.of(context);
        final screenWidth = mediaQuery.size.width;
        final screenHeight = mediaQuery.size.height;
        final textScaleFactor = mediaQuery.textScaleFactor;

        // Calculate scale factors
        final widthScaleFactor = screenWidth / ResponsiveLayout.baseWidth;
        final heightScaleFactor = screenHeight / ResponsiveLayout.baseHeight;
        final fontScaleFactor = (widthScaleFactor * 0.6 + heightScaleFactor * 0.4).clamp(0.8, 1.4);

        // Determine screen type
        ScreenType screenType;
        if (screenWidth <= ResponsiveLayout.mobileBreakpoint) {
          screenType = ScreenType.mobile;
        } else if (screenWidth <= ResponsiveLayout.tabletBreakpoint) {
          screenType = ScreenType.tablet;
        } else {
          screenType = ScreenType.desktop;
        }

        // Create data object
        final responsiveData = ResponsiveData(
          screenType: screenType,
          screenWidth: screenWidth,
          screenHeight: screenHeight,
          fontScaleFactor: fontScaleFactor,
          widthScaleFactor: widthScaleFactor,
          heightScaleFactor: heightScaleFactor,
          textScaleFactor: textScaleFactor,
        );

        return ResponsiveProvider(
          data: responsiveData,
          child: child,
        );
      },
    );
  }
}
