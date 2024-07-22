import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:web_portfolio/src/utils/project_utils.dart';

import 'dart:js' as js;

import '../themes/themes.dart';

class ProjectsCardWidget extends StatelessWidget {
  const ProjectsCardWidget({
    super.key,
    required this.project,
  });

  final ProjectUtils project;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      height: 280,
      width: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: CustomColor.bgLiht2,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            project.image, //'assets/projects/tm_ejemplo.png',
            height: 140,
            width: 250,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 15, 12, 12),
            child: Text(
              project.title,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: CustomColor.whitePrimary,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
            child: Text(
              project.subtitle,
              style: const TextStyle(
                fontSize: 12,
                color: CustomColor.witheSecondary,
              ),
            ),
          ),
          const Spacer(),
          //footer
          Container(
            color: CustomColor.bgLiht1,
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const AutoSizeText(
                  'Available on: ',
                  style: TextStyle(
                    color: CustomColor.yellowPrimary,
                    fontSize: 10,
                  ),
                ),
                const Spacer(),
                if (project.androidLink != null)
                  Padding(
                    padding: const EdgeInsets.only(left: 6),
                    child: InkWell(
                      onTap: () {
                        js.context.callMethod(
                          "open",
                          [project.androidLink],
                        );
                      },
                      child: Image.asset(
                        'assets/projects/androide.png',
                        width: 18,
                        color: CustomColor.yellowPrimary,
                      ),
                    ),
                  ),
                if (project.iosLink != null)
                  Padding(
                    padding: const EdgeInsets.only(left: 6),
                    child: InkWell(
                      onTap: () {
                        js.context.callMethod(
                          "open",
                          [project.iosLink],
                        );
                      },
                      child: Image.asset(
                        'assets/projects/manzana.png',
                        width: 18,
                        color: CustomColor.yellowPrimary,
                      ),
                    ),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
