import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../themes/themes.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      width: double.maxFinite,
      alignment: Alignment.center,
      child: const AutoSizeText(
        'Made by Oscar Ramirez with flutter 3.22',
        style: TextStyle(
          fontWeight: FontWeight.w400,
          color: CustomColor.witheSecondary,
        ),
      ),
    );
  }
}
