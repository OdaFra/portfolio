// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:web_portfolio/src/themes/colors.dart';

class CustomFloatActionButton extends StatelessWidget {
  CustomFloatActionButton({super.key, required this.onPress});
  void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      onPress: onPress,
      icon: Icons.keyboard_control_key,
      animatedIconTheme: const IconThemeData(size: 25.0),
      backgroundColor: CustomColor.yellowPrimary,
      visible: true,
      curve: Curves.bounceInOut,
    );
  }
}
