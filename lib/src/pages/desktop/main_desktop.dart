// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:js' as js;

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:redisenho_portfolio/src/constants/constants.dart';
import 'package:redisenho_portfolio/src/themes/colors.dart';

class MainDesktop extends StatelessWidget {
  const MainDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;

    return Container(
      width: screenSize.width,
      height: screenHeight,
      padding: const EdgeInsets.symmetric(horizontal: 100.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Left side texts
          Expanded(
            flex: 6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: CustomColor.accentPrimary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                        color: CustomColor.accentPrimary.withOpacity(0.3)),
                  ),
                  child: Text(
                    '👋 BIENVENIDO A MI PORTFOLIO',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2,
                      color: CustomColor.accentPrimary,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'Oscar Ramirez',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Soy ",
                      style:
                          Theme.of(context).textTheme.headlineLarge?.copyWith(
                                color: CustomColor.textSecondary,
                              ),
                    ),
                    DefaultTextStyle(
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .copyWith(
                            color: CustomColor.accentSecondary, // Electric Blue
                          ),
                      child: AnimatedTextKit(
                        repeatForever: true,
                        animatedTexts: [
                          TyperAnimatedText('Technical Lead',
                              speed: const Duration(milliseconds: 100)),
                          TyperAnimatedText('Senior Flutter Developer',
                              speed: const Duration(milliseconds: 100)),
                          TyperAnimatedText('Backend Developer',
                              speed: const Duration(milliseconds: 100)),
                          TyperAnimatedText('AWS Cloud Engineer',
                              speed: const Duration(milliseconds: 100)),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Text(
                  'Construyo aplicaciones móviles robustas y sistemas backend escalables,\naplicando principios modernos de Clean Architecture y rendimiento.',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 40),
                // Premium Buttons
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        js.context
                            .callMethod('open', ['https://github.com/OdaFra']);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: CustomColor.accentPrimary,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 20),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        elevation: 0,
                      ),
                      child: Text(
                        'Ver Proyectos',
                        style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Row(
                      children: contactsItems.map((contact) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 15.0),
                          child: InkWell(
                            onHover: (value) {},
                            onTap: () {
                              js.context
                                  .callMethod('open', [contact['contact']]);
                            },
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: CustomColor.panelBg,
                                border:
                                    Border.all(color: CustomColor.panelBorder),
                              ),
                              child: Center(
                                child: Image.asset(
                                  contact['icon'],
                                  width: 22,
                                  color: CustomColor.textPrimary,
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Right Side Abstract Visual (Instead of literal picture)
          Expanded(
            flex: 4,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Pulsing visual core
                Container(
                  width: 350,
                  height: 350,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [
                          CustomColor.accentPrimary.withOpacity(0.3),
                          CustomColor.accentSecondary.withOpacity(0.3)
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: CustomColor.accentPrimary.withOpacity(0.2),
                          blurRadius: 100,
                          spreadRadius: 20,
                        )
                      ]),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(1000),
                  child: Image.asset(
                    'assets/imgs/perfil/perfilgithub.jpeg',
                    width: 320,
                    height: 320,
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high,
                    cacheWidth: 800, // Force high-res decode for HiDPI screens
                    frameBuilder:
                        (context, child, frame, wasSynchronouslyLoaded) {
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
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
