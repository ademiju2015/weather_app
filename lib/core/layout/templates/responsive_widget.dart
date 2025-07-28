import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ResponsiveWidget extends StatelessWidget {
  const ResponsiveWidget({super.key, 
  required this.desktop,
  required this.tablet,
  required this.mobile});

  final Widget desktop;
  final Widget tablet;
  final Widget mobile;




  @override
  Widget build(BuildContext context) {
    final responsive =  ResponsiveBreakpoints.of(context);
     if (responsive.isMobile) {
          return mobile;
        } else if (responsive.isTablet) {
          return tablet;
        } else {
          return desktop;
        }
  }
}