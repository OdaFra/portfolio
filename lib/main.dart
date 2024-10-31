import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_portfolio/src/providers/providers.dart';
import 'src/pages/page.dart';
import 'src/themes/app_styles.dart';

void main() => runApp(
      const ProviderScope(
        child: MyApp(),
      ),
    );

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      themeMode: ref.watch(themeModeNotifierProvider) == ThemeMode.light
          ? ThemeMode.light
          : ThemeMode.dark,
      theme: lightTheme,
      darkTheme: darkTheme,
      debugShowCheckedModeBanner: false,
      title: 'Portfolio de Oda',
      home: const HomePage(),
    );
  }
}
