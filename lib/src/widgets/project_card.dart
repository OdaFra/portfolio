// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:js' as js;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:redisenho_portfolio/src/utils/project_utils.dart';

import '../themes/colors.dart';

class ProjectsCardWidget extends StatefulWidget {
  const ProjectsCardWidget({
    super.key,
    required this.project,
  });

  final ProjectUtils project;

  @override
  State<ProjectsCardWidget> createState() => _ProjectsCardWidgetState();
}

class _ProjectsCardWidgetState extends State<ProjectsCardWidget> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutCubic,
        transform: Matrix4.identity()..translate(0.0, isHovered ? -10.0 : 0.0),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: CustomColor.panelBg.withOpacity(0.6),
          border: Border.all(
            color: isHovered
                ? CustomColor.accentPrimary.withOpacity(0.8)
                : CustomColor.panelBorder,
            width: 1.5,
          ),
          boxShadow: isHovered
              ? [
                  BoxShadow(
                    color: CustomColor.accentPrimary.withOpacity(0.3),
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
          mainAxisSize: MainAxisSize.min,
          children: [
            // Image with overlay
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(18),
                    topRight: Radius.circular(18),
                  ),
                  child: Image.asset(
                    widget.project.image,
                    width: double.infinity,
                    height: 180,
                    fit: BoxFit.cover,
                  ),
                ),
                if (isHovered)
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(18),
                          topRight: Radius.circular(18),
                        ),
                        gradient: LinearGradient(
                          colors: [
                            CustomColor.accentPrimary.withOpacity(0.5),
                            Colors.transparent,
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: Text(
                widget.project.title,
                style: GoogleFonts.outfit(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: CustomColor.textPrimary,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: Text(
                widget.project.subtitle ?? '',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: CustomColor.textSecondary,
                  height: 1.5,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            // Footer
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              decoration: const BoxDecoration(
                border: Border(top: BorderSide(color: CustomColor.panelBorder)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Links:',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: CustomColor.textSecondary,
                    ),
                  ),
                  Row(
                    children: [
                      if (widget.project.gitHubLink != null)
                        _buildIconLink(
                          Icons.code_rounded,
                          widget.project.gitHubLink!,
                          'GitHub',
                        ),
                      if (widget.project.androidLink != null)
                        _buildAssetLink(
                          'assets/imgs/platforms/android.png',
                          widget.project.androidLink!,
                        ),
                      if (widget.project.iosLink != null)
                        _buildAssetLink(
                          'assets/imgs/platforms/ios.png',
                          widget.project.iosLink!,
                        ),
                      if (widget.project.webLink != null)
                        _buildIconLink(
                          Icons.language_rounded,
                          widget.project.webLink!,
                          'Web',
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Builds a link button using a Material Icon (for GitHub, Web, etc.)
  Widget _buildIconLink(IconData icon, String link, String tooltip) {
    return Padding(
      padding: const EdgeInsets.only(left: 12),
      child: Tooltip(
        message: tooltip,
        child: InkWell(
          onTap: () {
            js.context.callMethod("open", [link]);
          },
          child: Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: CustomColor.accentSecondary.withOpacity(0.15),
              shape: BoxShape.circle,
              border: Border.all(
                  color: CustomColor.accentSecondary.withOpacity(0.5)),
              boxShadow: [
                BoxShadow(
                  color: CustomColor.accentSecondary.withOpacity(0.2),
                  blurRadius: 10,
                  spreadRadius: 1,
                )
              ],
            ),
            child: Center(
              child: Icon(
                icon,
                color: CustomColor.whitePrimary,
                size: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Builds a link button using an image asset (for Android, iOS store icons)
  Widget _buildAssetLink(String asset, String link) {
    return Padding(
      padding: const EdgeInsets.only(left: 12),
      child: InkWell(
        onTap: () {
          js.context.callMethod("open", [link]);
        },
        child: Container(
          width: 38,
          height: 38,
          decoration: BoxDecoration(
            color: CustomColor.accentSecondary.withOpacity(0.15),
            shape: BoxShape.circle,
            border:
                Border.all(color: CustomColor.accentSecondary.withOpacity(0.5)),
            boxShadow: [
              BoxShadow(
                color: CustomColor.accentSecondary.withOpacity(0.2),
                blurRadius: 10,
                spreadRadius: 1,
              )
            ],
          ),
          child: Center(
            child: Image.asset(
              asset,
              width: 20,
              color: CustomColor.whitePrimary,
            ),
          ),
        ),
      ),
    );
  }
}
