import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/constants.dart';
import '../themes/colors.dart';

class WorkExperience extends StatelessWidget {
  const WorkExperience({
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
    bool isDesktop = constraints.maxWidth >= 992;
    bool isMobile = constraints.maxWidth < 600;
    double paddingX = isDesktop ? 100 : 20;

    return Container(
      key: navbarKeys[2],
      width: screenWidth,
      padding: EdgeInsets.symmetric(horizontal: paddingX, vertical: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader(context, "Experiencia Laboral", isMobile),
          const SizedBox(height: 40),

          // Timeline Container
          Stack(
            children: [
              // Glowing Vertical Line
              Positioned(
                left: isMobile ? 15 : 23,
                top: 0,
                bottom: 0,
                child: Container(
                  width: 2,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          CustomColor.accentPrimary.withOpacity(0.1),
                          CustomColor.accentPrimary,
                          CustomColor.accentSecondary.withOpacity(0.1),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: CustomColor.accentPrimary.withOpacity(0.5),
                          blurRadius: 10,
                          spreadRadius: 2,
                        )
                      ]),
                ),
              ),
              // Experience Items
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: workExperienceItems
                    .map((item) => _AnimatedExperienceCard(
                        item: item, isDesktop: isDesktop, isMobile: isMobile))
                    .toList(),
              ),
            ],
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
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [CustomColor.accentSecondary, Colors.transparent],
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
                  CustomColor.accentSecondary.withOpacity(0.5),
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

class _AnimatedExperienceCard extends StatefulWidget {
  final Map item;
  final bool isDesktop;
  final bool isMobile;

  const _AnimatedExperienceCard({
    required this.item,
    required this.isDesktop,
    required this.isMobile,
  });

  @override
  State<_AnimatedExperienceCard> createState() =>
      _AnimatedExperienceCardState();
}

class _AnimatedExperienceCardState extends State<_AnimatedExperienceCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: MouseRegion(
        onEnter: (_) => setState(() => isHovered = true),
        onExit: (_) => setState(() => isHovered = false),
        cursor: SystemMouseCursors.click,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Glowing Dot
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.only(top: 10),
              width: widget.isMobile ? 32 : 48,
              height: widget.isMobile ? 32 : 48,
              decoration: BoxDecoration(
                  color: isHovered
                      ? CustomColor.accentPrimary.withOpacity(0.2)
                      : CustomColor.panelBg,
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: isHovered
                          ? CustomColor.accentSecondary
                          : CustomColor.accentPrimary,
                      width: isHovered ? 3 : 2),
                  boxShadow: [
                    BoxShadow(
                      color: isHovered
                          ? CustomColor.accentSecondary.withOpacity(0.5)
                          : CustomColor.accentPrimary.withOpacity(0.3),
                      blurRadius: isHovered ? 15 : 10,
                      spreadRadius: isHovered ? 4 : 2,
                    )
                  ]),
              child: Icon(
                Icons.work_outline,
                color: isHovered
                    ? CustomColor.accentSecondary
                    : CustomColor.accentPrimary,
                size: widget.isMobile ? 14 : 20,
              ),
            ),
            SizedBox(width: widget.isMobile ? 16 : 30),
            // Content Glass Card
            Expanded(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOutCubic,
                transform: Matrix4.identity()
                  ..translate(0.0, isHovered ? -6.0 : 0.0),
                padding: EdgeInsets.all(widget.isMobile ? 16 : 30),
                decoration: BoxDecoration(
                  color: isHovered
                      ? CustomColor.panelBg.withOpacity(0.8)
                      : CustomColor.panelBg.withOpacity(0.4),
                  borderRadius:
                      BorderRadius.circular(widget.isMobile ? 16 : 20),
                  border: Border.all(
                    color: isHovered
                        ? CustomColor.accentSecondary.withOpacity(0.8)
                        : CustomColor.panelBorder.withOpacity(0.5),
                    width: isHovered ? 1.5 : 1.0,
                  ),
                  boxShadow: isHovered
                      ? [
                          BoxShadow(
                            color: CustomColor.accentSecondary.withOpacity(0.2),
                            blurRadius: 20,
                            spreadRadius: 2,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Year badge on top for mobile
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: isHovered
                            ? CustomColor.accentSecondary.withOpacity(0.15)
                            : CustomColor.accentPrimary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            color: isHovered
                                ? CustomColor.accentSecondary.withOpacity(0.6)
                                : CustomColor.accentPrimary.withOpacity(0.3)),
                      ),
                      child: Text(
                        widget.item['year'] ?? '',
                        style: GoogleFonts.inter(
                          fontSize: widget.isMobile ? 12 : 14,
                          fontWeight: FontWeight.w600,
                          color: isHovered
                              ? CustomColor.accentSecondary
                              : CustomColor.accentPrimary,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    // Position title
                    AnimatedDefaultTextStyle(
                      duration: const Duration(milliseconds: 300),
                      style: GoogleFonts.outfit(
                        fontSize: widget.isMobile ? 16 : 22,
                        fontWeight: FontWeight.w700,
                        color: isHovered
                            ? CustomColor.whitePrimary
                            : CustomColor.textPrimary,
                      ),
                      child: Text(
                        (widget.item['position'] ?? '')
                            .toString()
                            .toUpperCase(),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "${widget.item['company']} • ${widget.item['ubication']}",
                      style: GoogleFonts.inter(
                        fontSize: widget.isMobile ? 13 : 16,
                        fontWeight: FontWeight.w500,
                        color: CustomColor.textSecondary,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      widget.item['description'] ?? '',
                      style: GoogleFonts.inter(
                        fontSize: widget.isMobile ? 13 : 16,
                        color: CustomColor.textSecondary.withOpacity(0.8),
                        height: 1.6,
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Render skills used
                    if (widget.item['skill'] != null &&
                        (widget.item['skill'] as Map).isNotEmpty)
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children:
                            (widget.item['skill'] as Map).entries.map((entry) {
                          return Tooltip(
                            message: entry.key,
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              padding: EdgeInsets.all(widget.isMobile ? 6 : 8),
                              decoration: BoxDecoration(
                                color: isHovered
                                    ? CustomColor.accentSecondary
                                        .withOpacity(0.1)
                                    : CustomColor.panelBorder.withOpacity(0.4),
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: isHovered
                                        ? CustomColor.accentSecondary
                                            .withOpacity(0.5)
                                        : CustomColor.panelBorder,
                                    width: 1),
                              ),
                              child: Image.asset(
                                entry.value,
                                width: widget.isMobile ? 18 : 24,
                                height: widget.isMobile ? 18 : 24,
                                errorBuilder: (_, __, ___) => Icon(Icons.code,
                                    color: Colors.white,
                                    size: widget.isMobile ? 18 : 24),
                              ),
                            ),
                          );
                        }).toList(),
                      )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
