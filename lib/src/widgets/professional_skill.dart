import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/constants.dart';
import '../themes/colors.dart';

class ProfessionalSkills extends StatelessWidget {
  const ProfessionalSkills({
    super.key,
    required this.screenWidth,
    required this.constraints,
    required this.navbarKeys,
  });

  final double screenWidth;
  final BoxConstraints constraints;
  final List<GlobalKey> navbarKeys;

  @override
  Widget build(BuildContext context) {
    bool isDesktop = constraints.maxWidth >= 992;
    bool isMobile = constraints.maxWidth < 600;
    double paddingX = isDesktop ? 100 : 20;

    return Container(
      key: navbarKeys[1],
      width: screenWidth,
      padding: EdgeInsets.symmetric(horizontal: paddingX, vertical: 60),
      child: Column(
        crossAxisAlignment:
            isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        children: [
          _buildSectionHeader(context, "Tech Stack & Tools", isMobile),
          const SizedBox(height: 40),
          _buildSkillCategory("Frameworks & Platforms",
              [...frameworkItems, ...platformItems], isDesktop, isMobile),
          const SizedBox(height: 40),
          _buildSkillCategory(
              "Lenguajes", programingLanguages, isDesktop, isMobile),
          const SizedBox(height: 40),
          _buildSkillCategory("Herramientas & DBs",
              [...toolsItems, ...databaseItems], isDesktop, isMobile),
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
              shadows: [
                Shadow(
                  color: CustomColor.accentPrimary.withOpacity(0.5),
                  blurRadius: 10,
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Container(
            height: 2,
            width: 120,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  CustomColor.accentSecondary.withOpacity(0.8),
                  Colors.transparent
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: CustomColor.accentSecondary.withOpacity(0.5),
                  blurRadius: 10,
                  spreadRadius: 1,
                )
              ],
            ),
          ),
        ],
      );
    }
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(shadows: [
            Shadow(
              color: CustomColor.accentPrimary.withOpacity(0.5),
              blurRadius: 10,
            )
          ]),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Container(
            height: 2,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  CustomColor.accentSecondary.withOpacity(0.8),
                  Colors.transparent
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: CustomColor.accentSecondary.withOpacity(0.5),
                  blurRadius: 10,
                  spreadRadius: 1,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSkillCategory(
      String title, List<Map> items, bool isDesktop, bool isMobile) {
    return Column(
      crossAxisAlignment:
          isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.outfit(
            fontSize: isMobile ? 20 : 24,
            fontWeight: FontWeight.w600,
            color: CustomColor.textPrimary,
          ),
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
        ),
        const SizedBox(height: 20),
        Wrap(
          spacing: isMobile ? 12 : 20,
          runSpacing: isMobile ? 12 : 20,
          alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
          children: items.map((item) {
            return _AnimatedSkillCard(
                item: item, isDesktop: isDesktop, isMobile: isMobile);
          }).toList(),
        ),
      ],
    );
  }
}

class _AnimatedSkillCard extends StatefulWidget {
  final Map item;
  final bool isDesktop;
  final bool isMobile;

  const _AnimatedSkillCard(
      {required this.item, required this.isDesktop, required this.isMobile});

  @override
  State<_AnimatedSkillCard> createState() => _AnimatedSkillCardState();
}

class _AnimatedSkillCardState extends State<_AnimatedSkillCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    double cardWidth = widget.isMobile ? 100 : (widget.isDesktop ? 220 : 160);

    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutCubic,
        width: cardWidth,
        padding: EdgeInsets.symmetric(
          horizontal: widget.isMobile ? 8 : 16,
          vertical: widget.isMobile ? 14 : 20,
        ),
        transform: Matrix4.identity()..translate(0.0, isHovered ? -8.0 : 0.0),
        decoration: BoxDecoration(
          color: isHovered
              ? CustomColor.panelBg.withOpacity(0.9)
              : CustomColor.panelBg.withOpacity(0.4),
          borderRadius: BorderRadius.circular(widget.isMobile ? 14 : 20),
          border: Border.all(
            color: isHovered
                ? CustomColor.accentSecondary
                : CustomColor.panelBorder.withOpacity(0.5),
            width: isHovered ? 2.0 : 1.0,
          ),
          boxShadow: isHovered
              ? [
                  BoxShadow(
                    color: CustomColor.accentSecondary.withOpacity(0.3),
                    blurRadius: 20,
                    spreadRadius: 5,
                    offset: const Offset(0, 10),
                  )
                ]
              : [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    spreadRadius: 2,
                  )
                ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: EdgeInsets.all(widget.isMobile ? 10 : 16),
              decoration: BoxDecoration(
                color: isHovered
                    ? CustomColor.accentSecondary.withOpacity(0.2)
                    : CustomColor.panelBorder.withOpacity(0.4),
                shape: BoxShape.circle,
                border: Border.all(
                    color: isHovered
                        ? CustomColor.accentSecondary
                        : CustomColor.panelBorder,
                    width: 1),
                boxShadow: isHovered
                    ? [
                        BoxShadow(
                          color: CustomColor.accentSecondary.withOpacity(0.5),
                          blurRadius: 15,
                        )
                      ]
                    : [],
              ),
              child: Image.asset(
                widget.item['icon'],
                width: widget.isMobile ? 24 : 32,
                height: widget.isMobile ? 24 : 32,
                errorBuilder: (context, error, stackTrace) => Icon(
                  Icons.code,
                  color: Colors.white,
                  size: widget.isMobile ? 24 : 32,
                ),
              ),
            ),
            SizedBox(height: widget.isMobile ? 10 : 20),
            Text(
              widget.item['title'],
              style: GoogleFonts.inter(
                fontSize: widget.isMobile ? 12 : 16,
                fontWeight: FontWeight.w600,
                color: isHovered
                    ? CustomColor.whitePrimary
                    : CustomColor.textSecondary,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
