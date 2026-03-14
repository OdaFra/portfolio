import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:redisenho_portfolio/src/themes/colors.dart';
import '../../widgets/widgets.dart';

class HeaderMobile extends StatelessWidget implements PreferredSizeWidget {
  const HeaderMobile({super.key, this.onNavTitleTap, this.onNavMenuTap});
  final VoidCallback? onNavTitleTap;
  final VoidCallback? onNavMenuTap;

  @override
  final Size preferredSize = const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      decoration: BoxDecoration(
        color: CustomColor.panelBg.withOpacity(0.8),
        border: const Border(bottom: BorderSide(color: CustomColor.panelBorder, width: 1)),
      ),
      child: Row(
        children: [
          SiteLogo(
            onPressed: onNavTitleTap,
          ),
          const Spacer(),
          IconButton(
            onPressed: onNavMenuTap,
            icon: const Icon(Icons.menu, color: CustomColor.textPrimary),
          ),
          const SizedBox(width: 15),
        ],
      ),
    );
  }
}
