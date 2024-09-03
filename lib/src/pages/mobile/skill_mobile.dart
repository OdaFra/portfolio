import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../../constants/constants.dart';
import '../../themes/themes.dart';

class SkillMobile extends StatelessWidget {
  const SkillMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxHeight: 500,
      ),
      child: Column(
        children: [
          //Platforms
          for (int i = 0; i < platformItems.length; i++)
            Container(
              margin: const EdgeInsets.only(bottom: 5.0),
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: CustomColor.bgLiht2,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),
                leading: Image.asset(
                  platformItems[i]['icon'],
                  color: CustomColor.whitePrimary,
                  width: 26.0,
                ),
                title: AutoSizeText(platformItems[i]['title']),
              ),
            ),
          const SizedBox(height: 50),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            alignment: WrapAlignment.center,
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
          //Skill
        ],
      ),
    );
  }
}
