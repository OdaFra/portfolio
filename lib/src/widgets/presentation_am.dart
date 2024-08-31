import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../themes/themes.dart';

class CustomPresentationAM extends StatelessWidget {
  const CustomPresentationAM({
    super.key,
    required this.maxWidth,
  });

  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: maxWidth <= 350
              ? MainAxisAlignment.center
              : MainAxisAlignment.start,
          children: [
            Flexible(
              child: AutoSizeText(
                "Hey, soy Oscar Ramirez",
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: CustomColor.whitePrimary,
                  fontWeight: FontWeight.w800,
                  fontSize: maxWidth <= 350 ? 16.0 : 24.0,
                  height: 1.5,
                  letterSpacing: 1,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        AutoSizeText(
          textAlign: maxWidth <= 350 ? TextAlign.center : TextAlign.start,
          "+4 años de experiencia. Ingeniero en Informático de Asuncion, Paraguay 🇵🇾. Especializado en el desarrollo de aplicaciones móviles como el Back-End obteniendo un sólido conocimiento técnico y conceptual del ciclo de vida de desarrollo de software, como la implementación de arquitectura limpia.",
          style: TextStyle(
            color: CustomColor.textFieldBg,
            fontWeight: FontWeight.bold,
            fontSize: maxWidth <= 350 ? 14 : 16.0,
          ),
        ),
        const SizedBox(height: 25),
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
