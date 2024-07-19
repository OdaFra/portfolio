import 'package:flutter/material.dart';
import '../constants/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.controller,
    this.maxLine = 1,
    this.hintText,
  });
  final TextEditingController? controller;
  final int maxLine;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(
        color: CustomColor.scaffoldBg,
      ),
      controller: controller,
      maxLines: maxLine,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(16),
        filled: true,
        fillColor: CustomColor.witheSecondary,
        focusedBorder: getInputBorder,
        enabledBorder: getInputBorder,
        border: getInputBorder,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: CustomColor.hintDark,
        ),
      ),
    );
  }

  OutlineInputBorder get getInputBorder {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide.none,
    );
  }
}
