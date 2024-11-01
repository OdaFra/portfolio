import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../themes/themes.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
      width: double.maxFinite,
      child: const Center(
        child: AutoSizeText(
          'Realizado por Oscar Ramirez con flutter 3.22 - © 2024 Casi todos los derechos reservados',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            color: CustomColor.witheSecondary,
          ),
        ),
      ),
    );
  }
}
