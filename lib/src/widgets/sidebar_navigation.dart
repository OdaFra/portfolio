import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/nav_items.dart';
import '../themes/colors.dart';

class SidebarNavigation extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const SidebarNavigation({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  State<SidebarNavigation> createState() => _SidebarNavigationState();
}

class _SidebarNavigationState extends State<SidebarNavigation> {
  int? hoveredIndex;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          width: 70, // Collapsed by default, expands on hover? No, floating icons look best.
          padding: const EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            color: CustomColor.panelBg.withOpacity(0.5),
            borderRadius: BorderRadius.circular(40),
            border: Border.all(color: CustomColor.panelBorder.withOpacity(0.3), width: 1),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(navTitles.length, (index) {
              final isSelected = widget.selectedIndex == index;
              final isHovered = hoveredIndex == index;
              final isActive = isSelected || isHovered;

              return MouseRegion(
                onEnter: (_) => setState(() => hoveredIndex = index),
                onExit: (_) => setState(() => hoveredIndex = null),
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () => widget.onItemSelected(index),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOutCubic,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    width: isActive ? 50 : 44,
                    height: isActive ? 50 : 44,
                    decoration: BoxDecoration(
                      color: isActive
                          ? CustomColor.accentPrimary.withOpacity(0.2)
                          : Colors.transparent,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isActive 
                            ? CustomColor.accentPrimary.withOpacity(0.5) 
                            : Colors.transparent,
                      ),
                      boxShadow: isActive ? [
                        BoxShadow(
                          color: CustomColor.accentPrimary.withOpacity(0.3),
                          blurRadius: 10,
                          spreadRadius: 1,
                        )
                      ] : [],
                    ),
                    child: Tooltip(
                      message: navTitles[index],
                      textStyle: GoogleFonts.inter(
                        color: CustomColor.textPrimary,
                        fontSize: 12,
                      ),
                      decoration: BoxDecoration(
                        color: CustomColor.panelBg,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: CustomColor.panelBorder),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      child: Icon(
                        navIcons[index],
                        color: isActive ? CustomColor.accentPrimary : CustomColor.textSecondary,
                        size: isActive ? 24 : 20,
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
