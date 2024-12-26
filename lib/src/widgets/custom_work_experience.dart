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
                    // Posición
                    Text(
                      item['position'],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Empresa
                    Text(
                      item['company'],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),

                    // Año
                    Text(
                      item['year'],
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),

                    // Ubicación
                    Text(
                      item['ubication'],
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Descripción
                    Text(
                      item['description'],
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 30),

                    // Skills
                    (skillMap != null && skillMap.isNotEmpty)
                        ? Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: skillMap.entries.map((skill) {
                              return Chip(
                                labelPadding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                avatar: CircleAvatar(
                                  maxRadius: 15,
                                  backgroundImage: AssetImage(skill.value),
                                  backgroundColor:
                                      iconColor ?? Colors.transparent,
                                ),
                                label: Text(skill.key),
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
