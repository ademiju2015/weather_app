import 'package:flutter/material.dart';
import 'package:gpt_mini/core/layout/header/headers.dart';
import 'package:gpt_mini/core/layout/sidebar/sidebar.dart';
import 'package:gpt_mini/core/utils/colors.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key, required this.body});
  final Widget? body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: KColors.body,
      body:Row(
        children: [
          // Sidebar or Navigation Drawer
          // Expanded(
           KSidebar(),
          // ),
          // Main content area 
          Expanded(
            child:Column(
              children: [
                // AppBar or Header
                KHeader(),
                Expanded(
                  child: body ?? Center(
                    child: Text(
                      'Desktop Layout',
                      
                    ),
                  ),
                ),
              ],
            )
          ),
         
        ],
      ),
    );
  }
}