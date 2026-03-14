import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../themes/colors.dart';

class AboutMeSection extends StatelessWidget {
  const AboutMeSection({
    super.key,
    required this.screenWidth,
    required this.constraints,
    required this.aboutMe,
  });

  final double screenWidth;
  final BoxConstraints constraints;
  final List<Map> aboutMe;

  @override
  Widget build(BuildContext context) {
    bool isDesktop = constraints.maxWidth >= 992;
    bool isMobile = constraints.maxWidth < 600;
    double paddingX = isDesktop ? 100 : 20;

    return Container(
      width: screenWidth,
      padding: EdgeInsets.symmetric(horizontal: paddingX, vertical: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader(context, "Sobre mí", isMobile),
          const SizedBox(height: 40),
          isDesktop
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        flex: 7, child: _buildTextContent(context, isMobile)),
                    const SizedBox(width: 60),
                    Expanded(flex: 3, child: _buildStats(context, isMobile)),
                  ],
                )
              : Column(
                  children: [
                    _buildTextContent(context, isMobile),
                    const SizedBox(height: 40),
                    _buildStats(context, isMobile),
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

  Widget _buildTextContent(BuildContext context, bool isMobile) {
    return Container(
      padding: EdgeInsets.all(isMobile ? 20 : 40),
      decoration: BoxDecoration(
        color: CustomColor.panelBg.withOpacity(0.6),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: CustomColor.panelBorder),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 15,
            spreadRadius: 2,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hola! Mi nombre es Oscar',
            style: GoogleFonts.outfit(
              fontSize: isMobile ? 22 : 32,
              fontWeight: FontWeight.w700,
              color: CustomColor.textPrimary,
            ),
          ),
          const SizedBox(height: 20),
          for (int i = 0; i < aboutMe.length; i++)
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Text(
                aboutMe[i]['aboutme'] ?? aboutMe[i]['presentation'] ?? '',
                style: GoogleFonts.inter(
                  fontSize: isMobile ? 14 : 16,
                  color: CustomColor.textSecondary,
                  height: 1.8,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildStats(BuildContext context, bool isMobile) {
    if (isMobile) {
      // Horizontal layout on mobile
      return Row(
        children: [
          Expanded(
              child: _buildStatCard('Años', 'Experiencia', '4+', isMobile)),
          const SizedBox(width: 12),
          Expanded(
              child: _buildStatCard('Especialista', 'Mobile', '📱', isMobile)),
          const SizedBox(width: 12),
          Expanded(
              child:
                  _buildStatCard('Proyectos', 'Completados', '10+', isMobile)),
        ],
      );
    }
    return Column(
      children: [
        _buildStatCard('Años de', 'Experiencia', '4+', isMobile),
        const SizedBox(height: 20),
        _buildStatCard('Especialista en', 'Desarrollo', 'Mobile', isMobile),
        const SizedBox(height: 20),
        _buildStatCard('Proyectos', 'Completados', '10+', isMobile),
      ],
    );
  }

  Widget _buildStatCard(
      String title, String subtitle, String value, bool isMobile) {
    return Container(
      width: isMobile ? null : double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 16 : 30,
        horizontal: isMobile ? 10 : 20,
      ),
      decoration: BoxDecoration(
        color: CustomColor.panelBg,
        borderRadius: BorderRadius.circular(isMobile ? 16 : 20),
        border: Border.all(color: CustomColor.accentPrimary.withOpacity(0.3)),
        boxShadow: [
          BoxShadow(
            color: CustomColor.accentPrimary.withOpacity(0.1),
            blurRadius: 20,
            spreadRadius: 5,
          )
        ],
      ),
      child: Column(
        children: [
          Text(
            value,
            style: GoogleFonts.outfit(
              fontSize: isMobile ? 32 : 56,
              fontWeight: FontWeight.bold,
              color: CustomColor.accentPrimary,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            title,
            style: GoogleFonts.inter(
              fontSize: isMobile ? 11 : 14,
              fontWeight: FontWeight.w600,
              color: CustomColor.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            subtitle,
            style: GoogleFonts.inter(
              fontSize: isMobile ? 13 : 18,
              fontWeight: FontWeight.bold,
              color: CustomColor.textPrimary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
