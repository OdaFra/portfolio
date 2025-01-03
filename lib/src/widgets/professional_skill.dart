import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:web_portfolio/src/constants/constants.dart';

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
    final itemColor = Theme.of(context).colorScheme.onSecondary;
    return Container(
      key: navbarKeys[0],
      width: screenWidth,
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(width: 10),
              Expanded(
                child: AutoSizeText(
                  'Habilidades Profesionales',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: itemColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
          CustomsSkillsItems(
            title: 'Plataformas',
            skillList: platformItems,
          ),
          const SizedBox(height: 10),
          const CustomsSkillsItems(
            title: 'Lenguajes',
            skillList: programingLanguages,
          ),
          const SizedBox(height: 10),
          const CustomsSkillsItems(
            title: 'Librerias',
            skillList: frameworkItems,
          ),
          const SizedBox(height: 10),
          const CustomsSkillsItems(
            title: 'Herramientas',
            skillList: toolsItems,
          ),
          const SizedBox(height: 10),
          const CustomsSkillsItems(
            title: 'Bases de datos',
            skillList: databaseItems,
          ),
          const SizedBox(height: 10),
          const CustomsSkillsItems(
            title: 'Sistemas Operativos',
            skillList: osItems,
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
