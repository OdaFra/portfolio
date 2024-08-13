import 'package:flutter/material.dart';

import '../../themes/themes.dart';
import '../widgets.dart';

class HeaderMobile extends StatelessWidget implements PreferredSizeWidget {
  const HeaderMobile({super.key, this.onLogoTap, this.onMenuTap});
  final VoidCallback? onLogoTap;
  final VoidCallback? onMenuTap;

  @override
  final Size preferredSize = const Size.fromHeight(55.0);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.0,
      // margin: const EdgeInsets.fromLTRB(40, 5, 20, 5),
      decoration: kHederDecoration,
      child: Row(
        children: [
          SiteLogo(
            onPressed: onLogoTap,
          ),
          const Spacer(),
          IconButton(
            onPressed: onMenuTap,
            icon: const Icon(Icons.menu),
          ),
          const SizedBox(width: 15),
        ],
      ),
    );
  }
}
