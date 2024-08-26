import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:web_portfolio/src/themes/themes.dart';

import 'widgets.dart';

class ProfessionalSkills extends StatelessWidget {
  const ProfessionalSkills({
    super.key,
    required this.navbarKeys,
    required this.screenWidth,
    required this.constraints,
  });

  final List<GlobalKey<State<StatefulWidget>>> navbarKeys;
  final double screenWidth;
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: navbarKeys[0],
      width: screenWidth,
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
      color: CustomColor.bgLiht1,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 10),
              AutoSizeText(
                'Professional Skills',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: CustomColor.whitePrimary,
                  letterSpacing: 1.5,
                ),
              ),
            ],
          ),
          const SizedBox(height: 50),
          if (constraints.maxWidth >= 300)
            const Column(
              children: [
                CustomsSkillsItems(),
                SizedBox(height: 10),
              ],
            ) //SkillDesktop()
          // else
          //   const SkillMobile()
        ],
      ),
    );
  }
}
