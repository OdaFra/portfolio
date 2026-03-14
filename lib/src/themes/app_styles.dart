import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:redisenho_portfolio/src/themes/themes.dart';

ThemeData premiumDarkTheme = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: true,
  scaffoldBackgroundColor: CustomColor.scaffoldBg,
  colorScheme: const ColorScheme.dark(
    primary: CustomColor.accentPrimary,
    secondary: CustomColor.accentSecondary,
    surface: CustomColor.panelBg,
    onSurface: CustomColor.textPrimary,
  ),
  textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme).copyWith(
    displayLarge: GoogleFonts.outfit(
      fontSize: 64,
      fontWeight: FontWeight.w800,
      color: CustomColor.whitePrimary,
      letterSpacing: -1.5,
    ),
    displayMedium: GoogleFonts.outfit(
      fontSize: 48,
      fontWeight: FontWeight.w700,
      color: CustomColor.whitePrimary,
      letterSpacing: -1.0,
    ),
    headlineLarge: GoogleFonts.outfit(
      fontSize: 32,
      fontWeight: FontWeight.w700,
      color: CustomColor.whitePrimary,
      letterSpacing: -0.5,
    ),
    titleLarge: GoogleFonts.outfit(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: CustomColor.whitePrimary,
    ),
    bodyLarge: GoogleFonts.inter(fontSize: 18, color: CustomColor.textSecondary, height: 1.6),
    bodyMedium: GoogleFonts.inter(fontSize: 16, color: CustomColor.textSecondary, height: 1.6),
    labelLarge: GoogleFonts.inter(fontSize: 14, color: CustomColor.accentPrimary, fontWeight: FontWeight.w600, letterSpacing: 1.5),
  ),
);

// We export both as the same premium theme so the app looks stunning regardless of user preference toggle.
ThemeData lightTheme = premiumDarkTheme;
ThemeData darkTheme = premiumDarkTheme;
