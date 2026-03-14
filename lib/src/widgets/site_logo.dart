import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../themes/colors.dart';

class SiteLogo extends StatelessWidget {
  const SiteLogo({
    super.key,
    this.onPressed,
  });
  final VoidCallback? onPressed;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: TextButton(
        onPressed: onPressed,
        child: Row(
          children: [
            Text(
              '< ',
              style: GoogleFonts.outfit(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: CustomColor.accentSecondary,
              ),
            ),
            Text(
              'Oscar Ramirez',
              style: GoogleFonts.outfit(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: CustomColor.textPrimary,
              ),
            ),
            Text(
              ' />',
              style: GoogleFonts.outfit(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: CustomColor.accentPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
