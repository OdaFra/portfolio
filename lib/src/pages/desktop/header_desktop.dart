import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../constants/constants.dart';
import '../../providers/providers.dart';
import '../../themes/themes.dart';
import '../../utils/email_launcher.dart';
import '../../widgets/widgets.dart';

class HeaderDestkopAppBar extends ConsumerWidget
    implements PreferredSizeWidget {
  const HeaderDestkopAppBar(
      {super.key, required this.onNavMenuTap, this.onNavTitleTap});
  final Function(int) onNavMenuTap;
  final VoidCallback? onNavTitleTap;

  @override
  final Size preferredSize = const Size.fromHeight(55.0);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bgColor = Theme.of(context).scaffoldBackgroundColor;
    final itemColor = Theme.of(context).colorScheme.onSecondary;

    return AppBar(
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(4.0),
        child: Container(
          color: CustomColor.grey5Color,
          height: 1.0,
        ),
      ),
      scrolledUnderElevation: 0.0,
      actions: [
        IconButton(
          onPressed: () {
            EmailLauncher.launchEmail('osramirezf@gmail.com');
          },
          icon: Icon(
            Icons.mail_outline,
            color: itemColor,
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
        const SizedBox(width: 15),
      ],
      backgroundColor: bgColor,
      title: Container(
        height: 70,
        margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
        width: double.maxFinite,
        child: Row(
          children: [
            Center(
              child: SiteLogo(
                onPressed: onNavTitleTap,
              ),
            ),
            const Spacer(),
            for (int i = 0; i < navTitles.length; i++)
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: TextButton(
                  onPressed: () {
                    onNavMenuTap(i);
                  },
                  child: AutoSizeText(
                    navTitles[i],
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: itemColor,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
