import 'package:flutter/material.dart';
import 'package:web_portfolio/src/themes/themes.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  useMaterial3: true,
  scaffoldBackgroundColor: CustomColor.grey1Color,
  textTheme: const TextTheme(
    displayLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: CustomColor.grey5Color),
    bodyLarge: TextStyle(fontSize: 18, color: CustomColor.grey4Color),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: CustomColor.yellowPrimary,
    iconTheme: IconThemeData(color: CustomColor.grey5Color),
  ),
  colorScheme: const ColorScheme(
    onPrimaryContainer: CustomColor.yellowPrimary,
    brightness: Brightness.light,
    primary: CustomColor.grey5Color,
    onPrimary: CustomColor.yellowPrimary,
    secondary: CustomColor.grey3Color,
    onSecondary: CustomColor.grey5Color,
    surface: CustomColor.grey3Color,
    onSurface: CustomColor.grey5Color,
    error: Colors.red,
    onError: Colors.white,
  ),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: true,
  scaffoldBackgroundColor: CustomColor.scaffoldBg,
  textTheme: const TextTheme(
    displayLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: CustomColor.whitePrimary),
    bodyLarge: TextStyle(fontSize: 18, color: CustomColor.textFieldBg),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: CustomColor.bgLiht1,
    iconTheme: IconThemeData(color: CustomColor.whitePrimary),
  ),
  colorScheme: const ColorScheme(
    onPrimaryContainer: CustomColor.yellowPrimary,
    brightness: Brightness.dark,
    primary: CustomColor.yellowPrimary,
    onPrimary: CustomColor.whitePrimary,
    secondary: CustomColor.yellowPrimary,
    onSecondary: CustomColor.whitePrimary,
    surface: CustomColor.bgLiht1,
    onSurface: CustomColor.witheSecondary,
    error: Colors.red,
    onError: Colors.white,
  ),
);
