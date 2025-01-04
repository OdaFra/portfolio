import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final titleColor = Theme.of(context).colorScheme.onSecondary;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
      width: double.maxFinite,
      child: Center(
        child: AutoSizeText(
          'Realizado por Oscar Ramirez con flutter 3.24 - © 2025 Casi todos los derechos reservados',
          style: TextStyle(fontWeight: FontWeight.w400, color: titleColor),
        ),
      ),
    );
  }
}
