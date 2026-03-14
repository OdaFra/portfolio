import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../themes/colors.dart';
import '../utils/project_utils.dart';
import 'widgets.dart';

class ProjectSection extends StatelessWidget {
  const ProjectSection({super.key, required this.screenWidth});
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    bool isDesktop = screenWidth >= 992;
    bool isMobile = screenWidth < 600;
    double paddingX = isDesktop ? 100 : 20;

    return Container(
      width: screenWidth,
      padding: EdgeInsets.symmetric(horizontal: paddingX, vertical: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader(context, "Proyectos", isMobile),
          const SizedBox(height: 40),
          Text(
            'Proyectos de trabajo',
            style: GoogleFonts.outfit(
              fontSize: isMobile ? 20 : 24,
              fontWeight: FontWeight.w600,
              color: CustomColor.textPrimary,
            ),
          ),
          const SizedBox(height: 24),
          Wrap(
            spacing: isMobile ? 16 : 25,
            runSpacing: isMobile ? 16 : 25,
            children: workProjectUtils
                .map((project) => SizedBox(
                      width: isMobile ? double.infinity : 320,
                      child: ProjectsCardWidget(project: project),
                    ))
                .toList(),
          ),
          const SizedBox(height: 40),
          Text(
            'Proyectos personales',
            style: GoogleFonts.outfit(
              fontSize: isMobile ? 20 : 24,
              fontWeight: FontWeight.w600,
              color: CustomColor.textPrimary,
            ),
          ),
          const SizedBox(height: 24),
          Wrap(
            spacing: isMobile ? 16 : 25,
            runSpacing: isMobile ? 16 : 25,
            children: hobbyProjectUtils
                .map((project) => SizedBox(
                      width: isMobile ? double.infinity : 320,
                      child: ProjectsCardWidget(project: project),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(
      BuildContext context, String title, bool isMobile) {
    if (isMobile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.outfit(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: CustomColor.textPrimary,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            height: 2,
            width: 120,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  CustomColor.accentPrimary.withOpacity(0.5),
                  Colors.transparent
                ],
              ),
            ),
          ),
        ],
      );
    }
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Container(
            height: 1,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  CustomColor.accentPrimary.withOpacity(0.5),
                  Colors.transparent
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
