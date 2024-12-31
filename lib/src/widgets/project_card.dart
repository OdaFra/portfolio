// ignore_for_file: avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:web_portfolio/src/utils/project_utils.dart';
import 'dart:js' as js;

class ProjectsCardWidget extends StatelessWidget {
  const ProjectsCardWidget({
    super.key,
    required this.project,
  });

  final ProjectUtils project;

  @override
  Widget build(BuildContext context) {
    final itemColor = Theme.of(context).colorScheme.onSecondary;
    final containerBgColor = Theme.of(context).colorScheme.surface;

    return Container(
      clipBehavior: Clip.antiAlias,
      height: 240,
      width: 280,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: containerBgColor,
        border: Border.all(
          color: itemColor,
          width: 1.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: Image.asset(
                project.image,
                width: 280,
                height: 140,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 8, 12, 4),
            child: Text(
              project.title,
              style: TextStyle(fontWeight: FontWeight.w600, color: itemColor),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 8),
            child: Text(
              project.subtitle!,
              style: TextStyle(fontSize: 12, color: itemColor),
            ),
          ),
          // Footer
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const AutoSizeText(
                  'Disponible en: ',
                  style: TextStyle(
                    fontSize: 10,
                  ),
                ),
                Row(
                  children: [
                    if (project.gitHubLink != null)
                      Padding(
                        padding: const EdgeInsets.only(left: 6),
                        child: InkWell(
                          onTap: () {
                            js.context.callMethod(
                              "open",
                              [project.gitHubLink],
                            );
                          },
                          child: Image.asset(
                            'assets/imgs/tools/github.png',
                            width: 18,
                          ),
                        ),
                      ),
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
                            'assets/imgs/platforms/android.png',
                            width: 18,
                            color: itemColor,
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
                            'assets/imgs/platforms/ios.png',
                            width: 18,
                            color: itemColor,
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
