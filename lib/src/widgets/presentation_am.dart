import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../themes/themes.dart';

class CustomPresentationAM extends StatelessWidget {
  const CustomPresentationAM({
    super.key,
    required this.maxWidth,
    required this.aboutMe,
  });

  final double maxWidth;
  final List<Map> aboutMe;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int i = 0; i < aboutMe.length; i++) ...[
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Column(
              crossAxisAlignment: maxWidth <= 300
                  ? CrossAxisAlignment.center
                  : CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  aboutMe[i]['me'],
                  textAlign:
                      maxWidth <= 300 ? TextAlign.center : TextAlign.start,
                  style: TextStyle(
                    color: CustomColor.whitePrimary,
                    fontWeight: FontWeight.w800,
                    fontSize: maxWidth <= 350 ? 16.0 : 24.0,
                    height: 1.5,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 20),
                AutoSizeText(
                  aboutMe[i]['presentation'],
                  textAlign:
                      maxWidth <= 300 ? TextAlign.center : TextAlign.start,
                  style: TextStyle(
                    color: CustomColor.textFieldBg,
                    fontWeight: FontWeight.bold,
                    fontSize: maxWidth <= 350 ? 14 : 16.0,
                  ),
                  maxLines: 6,
                ),
              ],
            ),
          ),
        ],

        // El resto del contenido fijo
        AutoSizeText(
          "Contáctame",
          style: TextStyle(
            color: CustomColor.whitePrimary,
            fontWeight: FontWeight.w400,
            fontSize: maxWidth <= 350 ? 12 : 14.0,
            height: 1.5,
            letterSpacing: 3,
          ),
        ),
        const Divider(
          color: CustomColor.grey5Color,
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
