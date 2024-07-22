import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../themes/themes.dart';

class SiteLogo extends StatelessWidget {
  const SiteLogo({
    super.key,
    this.onTap,
  });
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: const Row(
        children: [
          AutoSizeText(
            '< ',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: CustomColor.whitePrimary,
            ),
          ),
          AutoSizeText(
            'Oscar Ramirez',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: CustomColor.yellowPrimary,
            ),
          ),
          AutoSizeText(
            ' />',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: CustomColor.whitePrimary,
            ),
          ),
        ],
      ),
    );
  }
}
