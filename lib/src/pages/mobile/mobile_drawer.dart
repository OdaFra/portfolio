import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../constants/constants.dart';
import '../../providers/providers.dart';
import '../../themes/themes.dart';

class MobileDrawer extends ConsumerWidget {
  const MobileDrawer({super.key, required this.onNavItemTap});
  final Function(int) onNavItemTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      backgroundColor: CustomColor.scaffoldBg,
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
                    ),
                    titleTextStyle: const TextStyle(
                      color: CustomColor.whitePrimary,
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
                onPressed: () {},
                icon: const Icon(
                  Icons.mail_outline,
                ),
              ),
              // const SizedBox(width: 5),
              // IconButton(
              //   onPressed: () {},
              //   icon: const Icon(
              //     Icons.language_rounded,
              //   ),
              // ),
              const SizedBox(width: 5),
              IconButton(
                icon: Icon(
                  ref.watch(themeModeNotifierProvider) == ThemeMode.light
                      ? Icons.light_mode_outlined
                      : Icons.dark_mode_outlined,
                ),
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
