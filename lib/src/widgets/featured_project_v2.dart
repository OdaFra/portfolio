import 'dart:js' as js;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../themes/colors.dart';

class FeaturedProjectSectionV2 extends StatefulWidget {
  const FeaturedProjectSectionV2({
    super.key,
    required this.screenWidth,
    required this.constraints,
  });

  final double screenWidth;
  final BoxConstraints constraints;

  @override
  State<FeaturedProjectSectionV2> createState() =>
      _FeaturedProjectSectionV2State();
}

class _FeaturedProjectSectionV2State extends State<FeaturedProjectSectionV2>
    with SingleTickerProviderStateMixin {
  late AnimationController _pulseController;
  late Animation<double> _glowAnimation;

  bool get isMobile => widget.constraints.maxWidth < 600;
  bool get isDesktop => widget.constraints.maxWidth >= 992;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(reverse: true);

    _glowAnimation = Tween<double>(begin: 0.2, end: 1.0).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOutSine),
    );
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double paddingX = isDesktop ? 100 : 20;

    return Container(
      width: widget.screenWidth,
      padding: EdgeInsets.symmetric(horizontal: paddingX, vertical: 80),
      child: Center(
        child: Container(
          width: isDesktop ? 900 : double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.black.withOpacity(0.6),
                CustomColor.panelBg.withOpacity(0.7),
                Colors.black.withOpacity(0.8),
              ],
            ),
            border: Border.all(
              color: CustomColor.accentSecondary.withOpacity(0.15),
              width: 1,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Animated Glowing Orb
                Positioned(
                  child: AnimatedBuilder(
                    animation: _glowAnimation,
                    builder: (context, child) {
                      return Container(
                        width: 300 + (_glowAnimation.value * 50),
                        height: 300 + (_glowAnimation.value * 50),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: CustomColor.accentSecondary
                                  .withOpacity(0.15 * _glowAnimation.value),
                              blurRadius: 150,
                              spreadRadius: 50,
                            ),
                            BoxShadow(
                              color: CustomColor.accentPrimary
                                  .withOpacity(0.1 * _glowAnimation.value),
                              blurRadius: 100,
                              spreadRadius: 20,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),

                // Glassmorphism effect
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
                  child: Container(
                    color: Colors.transparent,
                  ),
                ),

                // Content
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: isMobile ? 60 : 100,
                    horizontal: isMobile ? 30 : 60,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Enigmatic Icon / Symbol
                      AnimatedBuilder(
                        animation: _pulseController,
                        builder: (context, child) {
                          return Transform.scale(
                            scale: 0.95 + (_glowAnimation.value * 0.05),
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: CustomColor.panelBorder.withOpacity(0.3),
                                border: Border.all(
                                  color: CustomColor.accentSecondary
                                      .withOpacity(0.4),
                                  width: 2,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: CustomColor.accentSecondary
                                        .withOpacity(
                                            0.3 * _glowAnimation.value),
                                    blurRadius: 30,
                                    spreadRadius: 5,
                                  )
                                ],
                              ),
                              child: Icon(
                                Icons.all_inclusive_rounded,
                                size: isMobile ? 40 : 60,
                                color: CustomColor.whitePrimary,
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 40),

                      // Title
                      Text(
                        'Algo Extraordinario',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.outfit(
                          fontSize: isMobile ? 36 : 56,
                          fontWeight: FontWeight.w900,
                          color: CustomColor.whitePrimary,
                          letterSpacing: -1,
                          height: 1.1,
                        ),
                      ),
                      Text(
                        'SE APROXIMA',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          fontSize: isMobile ? 18 : 24,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 8,
                          foreground: Paint()
                            ..shader = const LinearGradient(
                              colors: [
                                CustomColor.accentPrimary,
                                CustomColor.accentSecondary,
                              ],
                            ).createShader(
                                const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
                        ),
                      ),
                      const SizedBox(height: 30),

                      // Description
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 600),
                        child: Text(
                          "Estoy forjando una experiencia digital sin precedentes. Un proyecto disruptivo que fusiona arquitectura limpia y diseño de primer nivel, a punto de irrumpir en escena. Pronto cambiará las reglas del juego.",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            fontSize: isMobile ? 15 : 18,
                            color: CustomColor.textSecondary,
                            height: 1.6,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),

                      // Call to action button
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: OutlinedButton(
                          onPressed: () {
                            js.context.callMethod('open', [
                              'https://www.linkedin.com/in/oscar-ramirez-franco/'
                            ]);
                          },
                          style: OutlinedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                              horizontal: isMobile ? 30 : 40,
                              vertical: isMobile ? 16 : 20,
                            ),
                            side: BorderSide(
                              color:
                                  CustomColor.accentSecondary.withOpacity(0.5),
                              width: 1.5,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            backgroundColor:
                                CustomColor.panelBorder.withOpacity(0.2),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'DESCIFRAR EL MISTERIO',
                                style: GoogleFonts.inter(
                                  fontSize: isMobile ? 13 : 15,
                                  fontWeight: FontWeight.w600,
                                  color: CustomColor.whitePrimary,
                                  letterSpacing: 2,
                                ),
                              ),
                              const SizedBox(width: 12),
                              const Icon(
                                Icons.arrow_forward_rounded,
                                color: CustomColor.accentSecondary,
                                size: 18,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
