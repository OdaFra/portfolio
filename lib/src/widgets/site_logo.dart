import 'package:flutter/material.dart';

import '../constants/constants.dart';

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
          Text(
            '< ',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: CustomColor.whitePrimary,
            ),
          ),
          Text(
            'Oscar Ramirez',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: CustomColor.yellowPrimary,
            ),
          ),
          Text(
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
