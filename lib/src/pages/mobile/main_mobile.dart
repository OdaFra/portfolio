// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:js' as js;

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:redisenho_portfolio/src/constants/constants.dart';
import 'package:redisenho_portfolio/src/themes/colors.dart';

class MainMobile extends StatelessWidget {
  const MainMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final isTiny = screenWidth < 380;

    return Container(
      width: screenSize.width,
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          // Pulsing visual core (Avatar)
          Container(
            width: isTiny ? 150 : 200,
            height: isTiny ? 150 : 200,
            margin: const EdgeInsets.only(bottom: 30),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    CustomColor.accentPrimary.withOpacity(0.3),
                    CustomColor.accentSecondary.withOpacity(0.3),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: CustomColor.accentPrimary.withOpacity(0.2),
                    blurRadius: 60,
                    spreadRadius: 10,
                  )
                ]),
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(
                  'assets/imgs/perfil/perfilgithub.jpeg',
                  width: isTiny ? 130 : 180,
                  height: isTiny ? 130 : 180,
                  fit: BoxFit.cover,
                  frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                    if (wasSynchronouslyLoaded) {
                      return child;
                    }
                    return AnimatedOpacity(
                      opacity: frame == null ? 0 : 1,
                      duration: const Duration(milliseconds: 800),
                      curve: Curves.easeOutCubic,
                      child: child,
                    );
                  },
                ),
              ),
            ),
          ),

          // Badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: CustomColor.accentPrimary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
              border:
                  Border.all(color: CustomColor.accentPrimary.withOpacity(0.3)),
            ),
            child: Text(
              '👋 BIENVENIDO',
              style: GoogleFonts.inter(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.2,
                color: CustomColor.accentPrimary,
              ),
            ),
          ),
          const SizedBox(height: 16),

          Text(
            'Oscar Ramirez',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  fontSize: isTiny ? 32 : 38,
                  letterSpacing: -0.5,
                ),
          ),
          const SizedBox(height: 10),

          // Animated role text - use Wrap for safety
          Column(
            children: [
              Text(
                "Soy ",
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: CustomColor.textSecondary,
                      fontSize: isTiny ? 18 : 22,
                    ),
              ),
              DefaultTextStyle(
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      color: CustomColor.accentSecondary,
                      fontSize: isTiny ? 18 : 22,
                    ),
                child: AnimatedTextKit(
                  repeatForever: true,
                  animatedTexts: [
                    TyperAnimatedText('Technical Lead',
                        speed: const Duration(milliseconds: 100)),
                    TyperAnimatedText('Senior Flutter Dev',
                        speed: const Duration(milliseconds: 100)),
                    TyperAnimatedText('Backend Developer',
                        speed: const Duration(milliseconds: 100)),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'Construyo apps móviles robustas y sistemas backend escalables con Clean Architecture.',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontSize: 14),
            ),
          ),

          const SizedBox(height: 24),

          // CTA Button
          ElevatedButton(
            onPressed: () {
              js.context.callMethod('open', ['https://github.com/OdaFra']);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: CustomColor.accentPrimary,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              elevation: 0,
            ),
            child: Text(
              'Ver Proyectos',
              style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
          ),
          const SizedBox(height: 16),

          // Social icons - wrapped for safety
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 8,
            runSpacing: 8,
            children: contactsItems.map((contact) {
              return InkWell(
                onTap: () {
                  js.context.callMethod('open', [contact['contact']]);
                },
                child: Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: CustomColor.panelBg,
                    border: Border.all(color: CustomColor.panelBorder),
                  ),
                  child: Center(
                    child: Image.asset(
                      contact['icon'],
                      width: 20,
                      color: CustomColor.textPrimary,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
