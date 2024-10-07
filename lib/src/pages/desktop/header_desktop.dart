import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../themes/themes.dart';
import '../../widgets/widgets.dart';

class HeaderDestkopAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const HeaderDestkopAppBar(
      {super.key, required this.onNavMenuTap, this.onNavTitleTap});
  final Function(int) onNavMenuTap;
  final VoidCallback? onNavTitleTap;

  @override
  final Size preferredSize = const Size.fromHeight(55.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(4.0),
        child: Container(
          color: CustomColor.grey5Color,
          height: 1.0,
        ),
      ),
      scrolledUnderElevation: 0.0,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.transparent,
              CustomColor.bgLiht1,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
      actions: [
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
          onPressed: () {},
          icon: const Icon(
            Icons.dark_mode,
          ),
        ),
        const SizedBox(width: 15),
      ],
      backgroundColor: CustomColor.scaffoldBg,
      title: Container(
        color: Colors.transparent,
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
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: CustomColor.whitePrimary,
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
