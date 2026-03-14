import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:redisenho_portfolio/src/constants/constants.dart';
import '../../widgets/widgets.dart';
import 'package:redisenho_portfolio/src/themes/colors.dart';

class MobileDrawer extends StatelessWidget {
  const MobileDrawer({super.key, required this.onNavItemTap});
  final Function(int) onNavItemTap;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: CustomColor.panelBg,
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.close, color: CustomColor.textPrimary),
              ),
            ),
          ),
          for (int i = 0; i < navIcons.length; i++)
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 30.0),
              titleTextStyle: GoogleFonts.inter(
                color: CustomColor.textPrimary,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
              onTap: () {
                onNavItemTap(i);
              },
              leading: Icon(navIcons[i], color: CustomColor.accentPrimary),
              title: Text(navTitles[i]),
            ),
        ],
      ),
    );
  }
}
