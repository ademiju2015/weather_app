import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:gpt_mini/core/utils/colors.dart';

class KHeader extends StatelessWidget implements PreferredSizeWidget {
  const KHeader({super.key, this.scaffoldKey});

  final GlobalKey<ScaffoldState>? scaffoldKey;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AppBar(
        title: Text(
          'Mini GPT',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
        ),
        // centerTitle: true,
        backgroundColor: KColors.body,
        elevation: 0,
        actions: [  
          IconButton(
            icon: Icon(LucideIcons.messageSquareDashed),
            onPressed: (){}, // Add your notification action here
            color: Colors.white,  
          ),
          SizedBox(width: 15), // Add some spacing between icons
          InkWell(
            onTap: () {
              
            },
            child: SizedBox(
              height: 30,
              width: 30,
              child: CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/images/avatar.png'), // Replace with your avatar image
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
