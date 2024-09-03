import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../themes/themes.dart';

class CustomsWorkExperience extends StatelessWidget {
  const CustomsWorkExperience({
    super.key,
    required this.workExperiencelList,
    this.i = 0,
    this.iconColor,
  });

  final int i;
  final List<Map> workExperiencelList;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 800),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Column(
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
                      for (int i = 0; i < workExperiencelList.length; i++)
                        Chip(
                          backgroundColor: CustomColor.bgLiht2,
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                          avatar:
                              AutoSizeText(workExperiencelList[i]['company']),
                          label:
                              AutoSizeText(workExperiencelList[i]['position']),
                        ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 20)
            ],
          )),
    );
  }
}
