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
            Wrap(
              spacing: 8,
              runSpacing: 8,
              alignment: WrapAlignment.center,
              children: skillList.map((skill) {
                return Chip(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 10.0,
                  ),
                  avatar: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.transparent,
                    child: Image.asset(
                      skill['icon'],
                      color: iconColor,
                      fit: BoxFit.contain,
                    ),
                  ),
                  label: Text(
                    skill['title'],
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
