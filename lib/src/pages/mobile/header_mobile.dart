import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class HeaderMobile extends StatelessWidget implements PreferredSizeWidget {
  const HeaderMobile({super.key, this.onNavTitleTap, this.onNavMenuTap});
  final VoidCallback? onNavTitleTap;
  final VoidCallback? onNavMenuTap;

  @override
  final Size preferredSize = const Size.fromHeight(55.0);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55.0,
      child: Row(
        children: [
          SiteLogo(
            onPressed: onNavTitleTap,
          ),
          const Spacer(),
          IconButton(
            onPressed: onNavMenuTap,
            icon: const Icon(Icons.menu),
          ),
          const SizedBox(width: 15),
        ],
      ),
    );
  }
}
