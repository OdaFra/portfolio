import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:web_portfolio/src/widgets/widgets.dart';

import '../constants/constants.dart';
import '../styles/styles.dart';

class HeaderDeskrop extends StatelessWidget {
  const HeaderDeskrop({super.key, required this.onNavMenuTap});
  final Function(int) onNavMenuTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      width: double.maxFinite,
      decoration: kHederDecoration,
      child: Row(
        children: [
          Center(
            child: SiteLogo(
              onTap: () {},
            ),
          ),
          const Spacer(),
          for (int i = 0; i < navTitles.length; i++)
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: TextButton(
                onPressed: () {
                  onNavMenuTap(i);
                },
                child: AutoSizeText(
                  navTitles[i],
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: CustomColor.whitePrimary,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
