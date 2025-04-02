// File: lib/src/responsive_text.dart
import 'package:flutter/material.dart';
import 'responsive_provider.dart';

/// Extension methods for text styling
extension ResponsiveTextStyle on TextStyle {
  /// Creates a responsive version of this TextStyle with adjusted font size
  TextStyle responsive(BuildContext context) {
    final responsiveData = ResponsiveProvider.maybeOf(context);

    if (responsiveData != null) {
      // Use cached scale factor from provider
      return copyWith(
        fontSize: fontSize! * responsiveData.fontScaleFactor,
      );
    }

    // Fallback calculation if provider is not used
    final width = MediaQuery.of(context).size.width;
    final baseWidth = 375.0;
    final scaleFactor = (width / baseWidth).clamp(0.8, 1.4);
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return copyWith(
      fontSize: fontSize! * scaleFactor * textScaleFactor,
    );
  }
}

/// Extension methods for text widget
extension ResponsiveText on Text {
  /// Creates a responsive version of this Text with adjusted style
  Text responsive(BuildContext context) {
    if (style == null) {
      final defaultStyle = DefaultTextStyle.of(context).style;
      return Text(
        data ?? '',
        key: key,
        style: defaultStyle.responsive(context),
        strutStyle: strutStyle,
        textAlign: textAlign,
        textDirection: textDirection,
        locale: locale,
        softWrap: softWrap,
        overflow: overflow,
        textScaleFactor: 1.0, // We handle scaling ourselves
        maxLines: maxLines,
        semanticsLabel: semanticsLabel,
        textWidthBasis: textWidthBasis,
        textHeightBehavior: textHeightBehavior,
      );
    }

    return Text(
      data ?? '',
      key: key,
      style: style!.responsive(context),
      strutStyle: strutStyle,
      textAlign: textAlign,
      textDirection: textDirection,
      locale: locale,
      softWrap: softWrap,
      overflow: overflow,
      textScaleFactor: 1.0, // We handle scaling ourselves
      maxLines: maxLines,
      semanticsLabel: semanticsLabel,
      textWidthBasis: textWidthBasis,
      textHeightBehavior: textHeightBehavior,
    );
  }
}