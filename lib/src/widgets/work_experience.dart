import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../constants/constants.dart';
import '../themes/themes.dart';
import 'widgets.dart';

class WorkExperience extends StatelessWidget {
  const WorkExperience(
      {super.key,
      required this.navbarKeys,
      required this.screenWidth,
      required this.constraints});

  final List<GlobalKey<State<StatefulWidget>>> navbarKeys;
  final double screenWidth;
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: navbarKeys[1],
      width: screenWidth,
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
      color: CustomColor.scaffoldBg,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // title
          const AutoSizeText(
            'Experiencia',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: CustomColor.whitePrimary,
            ),
          ),
          const SizedBox(height: 50),
          CustomsWorkExperience(workExperiencelList: workExperienceItems)
        ],
      ),
    );
  }
}
