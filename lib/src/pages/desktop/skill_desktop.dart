import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:web_portfolio/src/themes/colors.dart';

import '../../constants/constants.dart';
import '../../themes/themes.dart';

class SkillDesktop extends StatelessWidget {
  const SkillDesktop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 450),
          child: Wrap(
            spacing: 4,
            runSpacing: 4,
            children: [
              for (int i = 0; i < platformItems.length; i++)
                Container(
                  width: 200,
                  decoration: BoxDecoration(
                    color: CustomColor.bgLiht2,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 10.0,
                    ),
                    leading: Image.asset(
                      platformItems[i]['icon'],
                      color: CustomColor.whitePrimary,
                      width: 26.0,
                    ),
                    title: AutoSizeText(platformItems[i]['title']),
                  ),
                )
            ],
          ),
        ),
        const SizedBox(width: 50),
        //Skill
        Flexible(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (int i = 0; i < skillItems.length; i++)
                  Chip(
                      backgroundColor: CustomColor.bgLiht2,
                      padding: const EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 16.0),
                      avatar: Image.asset(skillItems[i]['icon']),
                      label: AutoSizeText(skillItems[i]['title']))
              ],
            ),
          ),
        )
      ],
    );
  }
}

