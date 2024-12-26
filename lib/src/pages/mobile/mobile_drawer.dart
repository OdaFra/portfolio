import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../constants/constants.dart';
import '../../providers/providers.dart';
import '../../utils/email_launcher.dart';

class MobileDrawer extends ConsumerWidget {
  const MobileDrawer({super.key, required this.onNavItemTap});
  final Function(int) onNavItemTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemColor = Theme.of(context).colorScheme.onSecondary;

    return Drawer(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
              child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.close)),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: navIcons.length,
                itemBuilder: (_, index) {
                  return ListTile(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 30.0),
                    leading: Icon(
                      navIcons[index],
                      color: itemColor,
                    ),
                    titleTextStyle: TextStyle(
                      color: itemColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                    title: AutoSizeText(
                      navTitles[index],
                    ),
                    onTap: () {
                      onNavItemTap(index);
                    },
                  );
                }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  EmailLauncher.launchEmail('osramirezf@gmail.com');
                },
                icon: const Icon(
                  Icons.mail_outline,
                ),
              ),
              const SizedBox(width: 5),
              IconButton(
                icon: Icon(
                  ref.watch(themeModeNotifierProvider) == ThemeMode.light
                      ? Icons.light_mode_outlined
                      : Icons.dark_mode_outlined,
                ),
                color: itemColor,
                onPressed: () =>
                    ref.read(themeModeNotifierProvider.notifier).toggle(),
              ),
            ],
          ),
          const SizedBox(height: 10)
        ],
      ),
    );
  }
}
