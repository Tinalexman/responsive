// File: lib/responsive_layout_builder.dart
library responsive_layout_builder;

export 'src/responsive_builder.dart';
export 'src/responsive_layout.dart';
export 'src/responsive_text.dart';
export 'src/responsive_provider.dart';









// Example pubspec.yaml content:
/*
name: responsive_layout_builder
description: A Flutter package for building responsive UIs using LayoutBuilder with performance optimization
version: 0.1.0
homepage: https://github.com/yourusername/responsive_layout_builder

environment:
  sdk: ">=2.17.0 <3.0.0"
  flutter: ">=2.0.0"

dependencies:
  flutter:
    sdk: flutter

dev_dependencies:
  flutter_test:
    sdk: flutter
  lints: ^2.0.0
*/

// Example of main.dart in example app:
/*
import 'package:flutter/material.dart';
import 'package:responsive_layout_builder/responsive_layout_builder.dart';

// Global navigator key for extension methods
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      home: ResponsiveApp(
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Responsive Layout Example'),
      ),
      body: ResponsiveBuilder(
        builder: (context, screenType) {
          switch (screenType) {
            case ScreenType.mobile:
              return MobileLayout();
            case ScreenType.tablet:
              return TabletLayout();
            case ScreenType.desktop:
              return DesktopLayout();
            default:
              return MobileLayout();
          }
        },
      ),
    );
  }
}

class MobileLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Using extension methods for dimensions
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Using responsive text
          Text(
            'Mobile Layout',
            style: TextStyle(fontSize: 18).responsive(context),
          ),

          // Using dimensions
          SizedBox(height: 20.h),

          // Using the .responsive extension on Text
          Text('This text is responsive').responsive(context),

          // Using ResponsiveLayout directly
          Container(
            width: ResponsiveLayout.relativeWidth(200, context),
            height: ResponsiveLayout.relativeHeight(100, context),
            color: Colors.blue,
            child: Center(
              child: Text(
                'Responsive Container',
                style: TextStyle(
                  fontSize: ResponsiveLayout.fontSize(16, context),
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TabletLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Tablet Layout',
        style: TextStyle(fontSize: 24).responsive(context),
      ),
    );
  }
}

class DesktopLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Desktop Layout',
        style: TextStyle(fontSize: 32).responsive(context),
      ),
    );
  }
}
*/