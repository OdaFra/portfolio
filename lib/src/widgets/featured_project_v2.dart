// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:js' as js;

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
  State<FeaturedProjectSectionV2> createState() => _FeaturedProjectSectionV2State();
}

class _FeaturedProjectSectionV2State extends State<FeaturedProjectSectionV2>
    with SingleTickerProviderStateMixin {
  bool isHovered = false;
  late AnimationController _pulseController;

  // ============================================================
  // ⚙️ CONFIG: Cambiar a true cuando la app se publique en tienda
  // ============================================================
  static const bool isLaunched = false;
  // ============================================================

  bool get isMobile => widget.constraints.maxWidth < 600;
  bool get isDesktop => widget.constraints.maxWidth >= 992;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
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
      padding: EdgeInsets.symmetric(horizontal: paddingX, vertical: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader(context),
          const SizedBox(height: 40),
          isDesktop ? _buildDesktopLayout() : _buildMobileLayout(),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────
  // SECTION HEADER
  // ─────────────────────────────────────────
  Widget _buildSectionHeader(BuildContext context) {
    if (isMobile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeaderBadge(compact: true),
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
            ),
          ),
        ],
      );
    }

    return Row(
      children: [
        _buildHeaderBadge(compact: false),
        const SizedBox(width: 20),
        Expanded(
          child: Container(
            height: 2,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  CustomColor.accentSecondary.withOpacity(0.8),
                  CustomColor.accentPrimary.withOpacity(0.3),
                  Colors.transparent,
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

  Widget _buildHeaderBadge({required bool compact}) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: compact ? 12 : 16,
        vertical: compact ? 6 : 8,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            CustomColor.accentPrimary.withOpacity(0.2),
            CustomColor.accentSecondary.withOpacity(0.2),
          ],
        ),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: CustomColor.accentPrimary.withOpacity(0.4),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.star_rounded,
              color: CustomColor.accentSecondary, size: compact ? 16 : 20),
          SizedBox(width: compact ? 6 : 8),
          Text(
            compact ? 'DESTACADO' : 'PROYECTO DESTACADO',
            style: GoogleFonts.inter(
              fontSize: compact ? 11 : 13,
              fontWeight: FontWeight.w700,
              color: CustomColor.accentSecondary,
              letterSpacing: 2,
            ),
          ),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────
  // DESKTOP LAYOUT
  // ─────────────────────────────────────────
  Widget _buildDesktopLayout() {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeOutCubic,
        transform: Matrix4.identity()..translate(0.0, isHovered ? -8.0 : 0.0),
        padding: const EdgeInsets.all(40),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          gradient: LinearGradient(
            colors: [
              CustomColor.panelBg.withOpacity(0.8),
              CustomColor.scaffoldBg.withOpacity(0.6),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          border: Border.all(
            color: isHovered
                ? CustomColor.accentSecondary.withOpacity(0.6)
                : CustomColor.panelBorder.withOpacity(0.5),
            width: isHovered ? 2 : 1,
          ),
          boxShadow: isHovered
              ? [
                  BoxShadow(
                    color: CustomColor.accentSecondary.withOpacity(0.15),
                    blurRadius: 40,
                    spreadRadius: 5,
                    offset: const Offset(0, 15),
                  ),
                ]
              : [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 20,
                    spreadRadius: 5,
                  )
                ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(flex: 4, child: _buildAppPreview()),
            const SizedBox(width: 60),
            Expanded(flex: 6, child: _buildProjectInfo()),
          ],
        ),
      ),
    );
  }

  // ─────────────────────────────────────────
  // MOBILE LAYOUT
  // ─────────────────────────────────────────
  Widget _buildMobileLayout() {
    return Container(
      padding: EdgeInsets.all(isMobile ? 16 : 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: CustomColor.panelBg.withOpacity(0.6),
        border: Border.all(color: CustomColor.panelBorder.withOpacity(0.5)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 20,
            spreadRadius: 5,
          )
        ],
      ),
      child: Column(
        children: [
          _buildAppPreview(),
          const SizedBox(height: 24),
          _buildProjectInfo(),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────
  // APP PREVIEW (Teaser phone mockup)
  // ─────────────────────────────────────────
  Widget _buildAppPreview() {
    double phoneWidth = isMobile ? 160 : (isDesktop ? 220 : 200);
    double phoneHeight = isMobile ? 300 : (isDesktop ? 420 : 380);

    return Stack(
      alignment: Alignment.center,
      children: [
        // Glow behind phone
        AnimatedBuilder(
          animation: _pulseController,
          builder: (context, child) {
            return Container(
              width: phoneWidth - 30,
              height: phoneHeight - 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xff2e7d32)
                        .withOpacity(0.15 + (_pulseController.value * 0.15)),
                    blurRadius: 50 + (_pulseController.value * 30),
                    spreadRadius: 5 + (_pulseController.value * 8),
                  ),
                ],
              ),
            );
          },
        ),
        // Phone mockup
        Container(
          width: phoneWidth,
          height: phoneHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(isMobile ? 24 : 30),
            border: Border.all(color: CustomColor.panelBorder, width: 3),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                blurRadius: 30,
                spreadRadius: 5,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(isMobile ? 21 : 27),
            child: Stack(
              fit: StackFit.expand,
              children: [
                // App screenshot
                Image.asset(
                  'assets/imgs/projects/finanzi_app.png',
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                ),
                // "Coming soon" frosted overlay
                if (!isLaunched)
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: const [0.0, 0.4, 0.7, 1.0],
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.1),
                          Colors.black.withOpacity(0.5),
                          Colors.black.withOpacity(0.85),
                        ],
                      ),
                    ),
                  ),
                // "Próximamente" floating text overlay
                if (!isLaunched)
                  Positioned(
                    bottom: isMobile ? 16 : 24,
                    left: 0,
                    right: 0,
                    child: Column(
                      children: [
                        AnimatedBuilder(
                          animation: _pulseController,
                          builder: (context, child) {
                            return Opacity(
                              opacity: 0.7 + (_pulseController.value * 0.3),
                              child: child,
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: isMobile ? 14 : 20,
                              vertical: isMobile ? 8 : 10,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xff2e7d32).withOpacity(0.25),
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                color: const Color(0xff4caf50).withOpacity(0.6),
                              ),
                            ),
                            child: Text(
                              '🚀 PRÓXIMAMENTE',
                              style: GoogleFonts.inter(
                                fontSize: isMobile ? 12 : 14,
                                fontWeight: FontWeight.w800,
                                color: const Color(0xff81c784),
                                letterSpacing: 2,
                              ),
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
      ],
    );
  }

  // ─────────────────────────────────────────
  // PROJECT INFO
  // ─────────────────────────────────────────
  Widget _buildProjectInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Status badge with animated dot
        _buildStatusBadge(),
        const SizedBox(height: 16),

        // App Name
        Text(
          'Finanzi',
          style: GoogleFonts.outfit(
            fontSize: isMobile ? 34 : 48,
            fontWeight: FontWeight.w800,
            color: CustomColor.whitePrimary,
            letterSpacing: -1,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          'Gestión inteligente de finanzas personales',
          style: GoogleFonts.inter(
            fontSize: isMobile ? 15 : 20,
            fontWeight: FontWeight.w500,
            color: CustomColor.accentSecondary,
          ),
        ),
        const SizedBox(height: 20),

        // Description
        Text(
          'App de finanzas personales con escaneo OCR de facturas potenciado por Inteligencia Artificial. '
          'Registra tus gastos de forma automática escaneando tus facturas y gestiona tus ingresos de forma manual. '
          'Visualiza tu balance total, genera reportes detallados y mantén el control absoluto de tu economía.',
          style: GoogleFonts.inter(
            fontSize: isMobile ? 13 : 16,
            color: CustomColor.textSecondary,
            height: 1.7,
          ),
        ),
        const SizedBox(height: 28),

        // ─ Benefits / Value Propositions ─
        _buildBenefitsSection(),

        const SizedBox(height: 28),

        // Tech tags
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            _buildTechTag('Flutter', Icons.phone_android_rounded),
            _buildTechTag('Dart', Icons.code_rounded),
            _buildTechTag('Inteligencia Artificial', Icons.auto_awesome_rounded),
            _buildTechTag('OCR', Icons.document_scanner_rounded),
            _buildTechTag('Firebase', Icons.cloud_rounded),
          ],
        ),
        const SizedBox(height: 28),

        // CTA Buttons
        _buildCtaButtons(),
      ],
    );
  }

  // ─────────────────────────────────────────
  // STATUS BADGE (Animated pulsing dot)
  // ─────────────────────────────────────────
  Widget _buildStatusBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(
        color: const Color(0xff2e7d32).withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xff4caf50).withOpacity(0.4),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Animated pulsing dot
          AnimatedBuilder(
            animation: _pulseController,
            builder: (context, child) {
              return Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: const Color(0xff4caf50),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xff4caf50)
                          .withOpacity(0.3 + (_pulseController.value * 0.5)),
                      blurRadius: 4 + (_pulseController.value * 6),
                      spreadRadius: _pulseController.value * 2,
                    )
                  ],
                ),
              );
            },
          ),
          const SizedBox(width: 8),
          Text(
            isLaunched
                ? 'DISPONIBLE EN PLAY STORE'
                : (isMobile
                    ? 'PRONTO EN PLAY STORE'
                    : 'PRÓXIMAMENTE EN PLAY STORE'),
            style: GoogleFonts.inter(
              fontSize: isMobile ? 10 : 11,
              fontWeight: FontWeight.w700,
              color: const Color(0xff4caf50),
              letterSpacing: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────
  // BENEFITS SECTION (Value propositions)
  // ─────────────────────────────────────────
  Widget _buildBenefitsSection() {
    final benefits = [
      {
        'icon': Icons.document_scanner_outlined,
        'title': 'Escaneo inteligente',
        'desc': 'Escanea tus facturas con IA y registra tus gastos al instante',
      },
      {
        'icon': Icons.bar_chart_rounded,
        'title': 'Dashboard financiero',
        'desc': 'Visualiza ingresos, gastos y balance total en tiempo real',
      },
      {
        'icon': Icons.receipt_long_rounded,
        'title': 'Registro automático',
        'desc': 'Solo toma una foto de tu factura y la IA procesa la información',
      },
      {
        'icon': Icons.analytics_outlined,
        'title': 'Reportes detallados',
        'desc': 'Historial financiero completo con gráficos y tendencias',
      },
    ];

    if (isMobile) {
      return Column(
        children: benefits
            .map((b) => Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: _buildBenefitCard(
                    b['icon'] as IconData,
                    b['title'] as String,
                    b['desc'] as String,
                  ),
                ))
            .toList(),
      );
    }

    // Desktop: 2x2 grid
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _buildBenefitCard(
                benefits[0]['icon'] as IconData,
                benefits[0]['title'] as String,
                benefits[0]['desc'] as String,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildBenefitCard(
                benefits[1]['icon'] as IconData,
                benefits[1]['title'] as String,
                benefits[1]['desc'] as String,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _buildBenefitCard(
                benefits[2]['icon'] as IconData,
                benefits[2]['title'] as String,
                benefits[2]['desc'] as String,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildBenefitCard(
                benefits[3]['icon'] as IconData,
                benefits[3]['title'] as String,
                benefits[3]['desc'] as String,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBenefitCard(IconData icon, String title, String desc) {
    return Container(
      padding: EdgeInsets.all(isMobile ? 14 : 18),
      decoration: BoxDecoration(
        color: CustomColor.panelBorder.withOpacity(0.2),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: CustomColor.panelBorder.withOpacity(0.5),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(isMobile ? 8 : 10),
            decoration: BoxDecoration(
              color: const Color(0xff2e7d32).withOpacity(0.12),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: const Color(0xff4caf50).withOpacity(0.25),
              ),
            ),
            child: Icon(icon,
                color: const Color(0xff81c784), size: isMobile ? 20 : 24),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.inter(
                    fontSize: isMobile ? 13 : 15,
                    fontWeight: FontWeight.w700,
                    color: CustomColor.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  desc,
                  style: GoogleFonts.inter(
                    fontSize: isMobile ? 11 : 13,
                    color: CustomColor.textSecondary,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────
  // CTA BUTTONS
  // ─────────────────────────────────────────
  Widget _buildCtaButtons() {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: [
        if (isLaunched)
          ElevatedButton.icon(
            onPressed: () {
              // TODO: Agregar link de Play Store cuando esté publicado
              js.context.callMethod('open', ['https://play.google.com']);
            },
            icon: Icon(Icons.play_arrow_rounded, size: isMobile ? 16 : 20),
            label: Text(
              'Descargar en Play Store',
              style: GoogleFonts.inter(
                fontSize: isMobile ? 13 : 15,
                fontWeight: FontWeight.w600,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff2e7d32),
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 28,
                vertical: isMobile ? 14 : 18,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14)),
              elevation: 0,
            ),
          )
        else
          OutlinedButton.icon(
            onPressed: () {
              js.context.callMethod('open',
                  ['https://www.linkedin.com/in/oscar-ramirez-franco/']);
            },
            icon: Icon(Icons.notifications_active_outlined,
                size: isMobile ? 16 : 20),
            label: Text(
              'Sígueme para el lanzamiento',
              style: GoogleFonts.inter(
                fontSize: isMobile ? 13 : 15,
                fontWeight: FontWeight.w600,
              ),
            ),
            style: OutlinedButton.styleFrom(
              foregroundColor: const Color(0xff81c784),
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 28,
                vertical: isMobile ? 14 : 18,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14)),
              side: BorderSide(
                color: const Color(0xff4caf50).withOpacity(0.5),
              ),
            ),
          ),
      ],
    );
  }

  // ─────────────────────────────────────────
  // TECH TAG
  // ─────────────────────────────────────────
  Widget _buildTechTag(String label, IconData icon) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 10 : 14,
        vertical: isMobile ? 6 : 8,
      ),
      decoration: BoxDecoration(
        color: CustomColor.panelBorder.withOpacity(0.4),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: CustomColor.panelBorder),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon,
              color: CustomColor.accentSecondary, size: isMobile ? 14 : 16),
          const SizedBox(width: 6),
          Text(
            label,
            style: GoogleFonts.inter(
              fontSize: isMobile ? 11 : 13,
              fontWeight: FontWeight.w600,
              color: CustomColor.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
