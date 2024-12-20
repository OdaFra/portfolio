import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../themes/themes.dart';

class CustomsSkillsItems extends StatelessWidget {
  const CustomsSkillsItems({
    super.key,
    required this.title,
    required this.skillList,
    this.i = 0,
    this.iconColor,
  });

  final String title;
  final int i;
  final List<Map> skillList;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    final collapsedBgColor = Theme.of(context).colorScheme.surface;
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 800),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: ExpansionTile(
          expandedAlignment: Alignment.center,
          collapsedBackgroundColor: collapsedBgColor,
          iconColor: CustomColor.yellowPrimary,
          textColor: CustomColor.yellowPrimary,
          title: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              letterSpacing: 1.5,
              height: 1.5,
            ),
          ),
          children: [
            LayoutBuilder(
              builder: (context, constraints) {
                return Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  direction: constraints.maxWidth > 300
                      ? Axis.horizontal
                      : Axis.vertical,
                  alignment: WrapAlignment.center,
                  children: [
                    for (int i = 0; i < skillList.length; i++)
                      Chip(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                        avatar: Image.asset(
                          skillList[i]['icon'],
                          color: iconColor,
                          width: 40.0,
                        ),
                        label: AutoSizeText(skillList[i]['title']),
                      ),
                  ],
                );
              },
            ),
            const SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}
