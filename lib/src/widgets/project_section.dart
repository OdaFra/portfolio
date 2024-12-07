import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../utils/project_utils.dart';
import 'widgets.dart';

class ProjectSection extends StatelessWidget {
  const ProjectSection({super.key, required this.screenWidth});
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    final titleColor = Theme.of(context).colorScheme.onSecondary;
    //Work Project
    return Container(
      width: screenWidth,
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
      child: Column(
        children: [
          //Work Project title
          AutoSizeText(
            'Proyectos de trabajo',
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: titleColor),
          ),
          const SizedBox(
            height: 40,
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Wrap(
              spacing: 25,
              runSpacing: 25,
              children: [
                for (int i = 0; i < workProjectUtils.length; i++)
                  ProjectsCardWidget(
                    project: workProjectUtils[i],
                  ),
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          //Hobby Project
          AutoSizeText(
            'Proyectos personales',
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: titleColor),
          ),
          const SizedBox(
            height: 40,
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 850),
            child: Wrap(
              spacing: 25,
              runSpacing: 25,
              children: [
                for (int i = 0; i < hobbyProjectUtils.length; i++)
                  ProjectsCardWidget(
                    project: hobbyProjectUtils[i],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
