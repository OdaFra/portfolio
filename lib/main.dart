import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_portfolio/src/providers/theme_provider.dart';

import 'src/page/page.dart';
import 'src/providers/providers.dart';

void main() {
  runApp(ChangeNotifierProvider<ThemeProvider>(
    create: (context) => ThemeProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeProvider.theme,
      title: 'Code With Oda - Portfolio',
      home: const HomePage(),
    );
  }
}
