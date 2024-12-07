import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

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
    final containerColor = Theme.of(context).colorScheme.surface;

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 800),
      child: Column(
        children: [
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: workExperiencelList.length,
            itemBuilder: (context, index) {
              final item = workExperiencelList[index];
              final skillMap = item['skill'] as Map<String, String>?;

              return Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: containerColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      item['position'],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    AutoSizeText(
                      item['company'],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    AutoSizeText(
                      item['year'],
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    AutoSizeText(
                      item['ubication'],
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 10),
                    AutoSizeText(
                      item['description'],
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 30),
                    (skillMap != null && skillMap.isNotEmpty)
                        ? Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: skillMap.entries.map((skill) {
                              return Chip(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10.0,
                                  horizontal: 10.0,
                                ),
                                avatar: Image.asset(
                                  skill.value,
                                  color: iconColor,
                                  width: 40.0,
                                ),
                                label: AutoSizeText(skill.key),
                              );
                            }).toList(),
                          )
                        : const SizedBox()
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
