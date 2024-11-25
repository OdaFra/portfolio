import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

// ignore: must_be_immutable
class CustomFloatActionButton extends StatelessWidget {
  CustomFloatActionButton({super.key, required this.onPress});
  void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    final containerColor = Theme.of(context).colorScheme.secondary;
    final iconColor = Theme.of(context).colorScheme.onSecondary;
    return SpeedDial(
      onPress: onPress,
      icon: Icons.keyboard_control_key,
      iconTheme: IconThemeData(
        color: iconColor,
        size: 25.0,
      ),
      backgroundColor: containerColor,
      visible: true,
      curve: Curves.bounceInOut,
    );
  }
}
