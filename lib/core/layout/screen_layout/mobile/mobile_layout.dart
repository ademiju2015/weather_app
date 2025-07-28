import 'package:flutter/material.dart';
import 'package:gpt_mini/core/layout/header/headers.dart';
import 'package:gpt_mini/core/layout/sidebar/sidebar.dart';

class MobileLayout extends StatelessWidget {
   MobileLayout({super.key, required this.body});
  final Widget? body;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: KSidebar  (),
      appBar: KHeader(),
      body: body ?? Center(
        child: Text(
          'Mobile Layout',
        ),
      ),
    );
  }
}