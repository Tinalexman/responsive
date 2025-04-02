import 'package:flutter/material.dart';
import 'package:responsive/responsive.dart';

// Global navigator key for extension methods
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
  const MyHomePage({super.key});

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
            }
        },
      ),
    );
  }
}

class MobileLayout extends StatelessWidget {
  const MobileLayout({super.key});

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
  const TabletLayout({super.key});

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
  const DesktopLayout({super.key});

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
