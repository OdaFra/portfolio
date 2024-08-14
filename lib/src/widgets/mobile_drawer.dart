import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../themes/themes.dart';

class MobileDrawer extends StatelessWidget {
  const MobileDrawer({super.key, required this.onNavItemTap});
  final Function(int) onNavItemTap;

  @override
  Widget build(BuildContext context) {
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
          // With For - Example
          // for (int i = 0; i < navIcons.length; i++)
          //   ListTile(
          //     contentPadding: const EdgeInsets.symmetric(horizontal: 30.0),
          //     leading: Icon(navIcons[i]),
          //     titleTextStyle: const TextStyle(
          //       color: CustomColor.whitePrimary,
          //       fontWeight: FontWeight.w600,
          //       fontSize: 16,
          //     ),
          //     title: AutoSizeText(navTitles[i]),
          //     onTap: () {
          //       onNavItemTap(i);
          //     },
          //   )
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.mail_outline,
                ),
              ),
              const SizedBox(width: 5),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.language_rounded,
                ),
              ),
              const SizedBox(width: 5),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.dark_mode,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10)
        ],
      ),
    );
  }
}
