import 'package:flutter/material.dart';
import 'package:gpt_mini/core/layout/screen_layout/desktop/desktop_layout.dart';
import 'package:gpt_mini/core/layout/templates/responsive_widget.dart';

import '../screen_layout/mobile/mobile_layout.dart';
import '../screen_layout/tablet/tablet_layout.dart';

class SiteTemplate extends StatelessWidget {
  const SiteTemplate({
    super.key,
    this.useLayout = true,
    this.desktop,
    this.tablet,
    this.mobile,
  });

  final Widget? desktop, tablet, mobile;
  final bool useLayout;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ResponsiveWidget(
          desktop:
              useLayout ? DesktopLayout(body: desktop) : desktop ?? Container(),
          tablet:
              useLayout
                  ? TabletLayout(body: tablet ?? desktop)
                  : tablet ?? Container(),
          mobile:
              useLayout
                  ? MobileLayout(body: mobile ?? desktop)
                  : mobile ?? Container(),
        ),
      ),
    );
  }
}
