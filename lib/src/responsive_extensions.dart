// File: lib/src/responsive_extensions.dart
import 'package:flutter/widgets.dart';
import 'responsive_provider.dart';
import 'responsive_layout.dart';

/// Extension for responsive dimensions
extension ResponsiveDimension on num {
  /// Get responsive width
  double get w => _responsiveWidth(this);

  /// Get responsive height
  double get h => _responsiveHeight(this);

  /// Get responsive font size
  double get sp => _responsiveFont(this);

  /// Get responsive dimension that scales with screen width
  double _responsiveWidth(num width) {
    return width * _getWidthScaleFactor();
  }

  /// Get responsive dimension that scales with screen height
  double _responsiveHeight(num height) {
    return height * _getHeightScaleFactor();
  }

  /// Get responsive font size that scales appropriately
  double _responsiveFont(num size) {
    return size * _getFontScaleFactor();
  }

  /// Get current width scale factor
  double _getWidthScaleFactor() {
    final context = _getResponsiveContext();
    if (context != null) {
      final responsiveData = ResponsiveProvider.maybeOf(context);
      if (responsiveData != null) {
        return responsiveData.widthScaleFactor;
      }
    }
    return 1.0; // Default if no context
  }

  /// Get current height scale factor
  double _getHeightScaleFactor() {
    final context = _getResponsiveContext();
    if (context != null) {
      final responsiveData = ResponsiveProvider.maybeOf(context);
      if (responsiveData != null) {
        return responsiveData.heightScaleFactor;
      }
    }
    return 1.0; // Default if no context
  }

  /// Get current font scale factor
  double _getFontScaleFactor() {
    final context = _getResponsiveContext();
    if (context != null) {
      final responsiveData = ResponsiveProvider.maybeOf(context);
      if (responsiveData != null) {
        return responsiveData.fontScaleFactor * responsiveData.textScaleFactor;
      }
    }
    return 1.0; // Default if no context
  }

  /// Get the current build context from navigator key
  BuildContext? _getResponsiveContext() {
    return null; // This needs a global navigator key - see example app
  }
}