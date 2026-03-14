import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../themes/colors.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      margin: const EdgeInsets.only(top: 80),
      decoration: const BoxDecoration(
        color: CustomColor.panelBg,
        border: Border(top: BorderSide(color: CustomColor.panelBorder)),
      ),
      child: Column(
        children: [
          Text(
            "Hecho con ❤️ en Flutter",
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w600,
              color: CustomColor.textPrimary,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "© ${DateTime.now().year} Oscar Ramirez.\nTodos los derechos reservados.",
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              color: CustomColor.textSecondary,
              fontSize: 14,
            ),
          )
        ],
      ),
    );
  }
}
