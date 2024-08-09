import 'package:flutter/material.dart';

import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:web_portfolio/src/themes/colors.dart';

class CustomFloatActionButton extends StatelessWidget {
  const CustomFloatActionButton(
      {super.key, this.onLanguageTap, this.onModoDarkTap});
  final VoidCallback? onLanguageTap;
  final Function()? onModoDarkTap;

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      
      animatedIcon: AnimatedIcons.menu_close,
      animatedIconTheme: const IconThemeData(size: 25.0),
      backgroundColor: CustomColor.yellowPrimary,
      visible: true,
      curve: Curves.bounceInOut,
      children: [
        SpeedDialChild(
          child: const Icon(
            Icons.dark_mode_outlined,
            color: CustomColor.whitePrimary,
          ),
          backgroundColor: CustomColor.yellowPrimary,
          onTap: onModoDarkTap,
          label: 'Theme',
          labelStyle: const TextStyle(
              fontWeight: FontWeight.w500, color: CustomColor.scaffoldBg),
          labelBackgroundColor: CustomColor.whitePrimary,
        ),
        SpeedDialChild(
          child: const Icon(
            Icons.language,
            color: CustomColor.whitePrimary,
          ),
          backgroundColor: CustomColor.yellowPrimary,
          onTap: onLanguageTap,
          label: 'English',
          labelStyle: const TextStyle(
              fontWeight: FontWeight.w500, color: CustomColor.scaffoldBg),
          labelBackgroundColor: CustomColor.whitePrimary,
        ),
      ],
    );
  }
}
