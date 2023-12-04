import 'package:flutter/material.dart';
import 'dimensions.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileBody2;
  final Widget desktopBody2;

  ResponsiveLayout({required this.mobileBody2, required this.desktopBody2});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < mobileWidth) {
          return mobileBody2;
        } else {
          return desktopBody2;
        }
      },
    );
  }
}
