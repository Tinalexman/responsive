// File: lib/src/responsive_builder.dart
import 'package:flutter/widgets.dart';
import 'responsive_layout.dart';
import 'responsive_provider.dart';

/// Screen type enum for different device sizes
enum ScreenType { mobile, tablet, desktop }

/// Builder widget for responsive layouts
class ResponsiveBuilder extends StatelessWidget {
  /// Builder function that provides context and screen type
  final Widget Function(BuildContext, ScreenType) builder;

  /// Constructor
  const ResponsiveBuilder({Key? key, required this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use the provider if available to avoid redundant MediaQuery calls
    final responsiveData = ResponsiveProvider.maybeOf(context);

    if (responsiveData != null) {
      return builder(context, responsiveData.screenType);
    }

    // Fallback to LayoutBuilder if provider is not used
    return LayoutBuilder(
      builder: (context, constraints) {
        ScreenType screenType;
        if (constraints.maxWidth <= ResponsiveLayout.mobileBreakpoint) {
          screenType = ScreenType.mobile;
        } else if (constraints.maxWidth <= ResponsiveLayout.tabletBreakpoint) {
          screenType = ScreenType.tablet;
        } else {
          screenType = ScreenType.desktop;
        }

        return builder(context, screenType);
      },
    );
  }
}