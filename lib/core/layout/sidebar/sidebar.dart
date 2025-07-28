import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:gpt_mini/core/utils/colors.dart';
import 'package:responsive_framework/responsive_framework.dart';

class KSidebar extends StatelessWidget {
  const KSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: ResponsiveBreakpoints.of(context).isMobile ? 250 : 250,
      shape: BeveledRectangleBorder(),
      child: Container(
        color: KColors.nav,
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
          children: [
            Column(
              spacing: 10,
              children: [
                DrawIconsAndText(
                  onPressed: () {},
                  icon: Icon(HugeIcons.strokeRoundedMessageAdd01),
                  text: 'New Chat',
                ),
                DrawIconsAndText(
                  onPressed: () {},
                  icon: Icon(LucideIcons.search),
                  text: 'Search chats',
                ),
              ],
            ),
            // Chat History Section
            const SizedBox(height: 20),
            Text(
              'Chat History',
              style: TextStyle(color: Colors.white.withValues(alpha: 0.7), fontSize: 14, fontWeight: FontWeight.w200),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      'Menu Item $index',
                      style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w100),
                    ),
                    onTap: () {
                      // Handle menu item tap
                      Navigator.pop(context); // Close the drawer
                    },
                  );
                },
                itemCount: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DrawIconsAndText extends StatelessWidget {
  const DrawIconsAndText({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.text,
  });
  final Function()? onPressed;
  final Widget icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 6,
      children: [
        IconButton(onPressed: onPressed, icon: icon, iconSize: 17),
        Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w200,
          ),
        ),
      ],
    );
  }
}
