import 'package:flutter/material.dart';
import '../themes/colors.dart';

class CustomFloatActionButton extends StatelessWidget {
  const CustomFloatActionButton({
    super.key,
    this.onPress,
  });
  final VoidCallback? onPress;
  
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPress,
      backgroundColor: CustomColor.accentPrimary.withOpacity(0.9),
      elevation: 10,
      highlightElevation: 20,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: CustomColor.accentSecondary.withOpacity(0.3)),
      ),
      child: const Icon(
        Icons.keyboard_arrow_up,
        color: Colors.white,
        size: 30,
      ),
    );
  }
}
