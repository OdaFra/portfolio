import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'dart:js' as js;
import '../constants/constants.dart';
import '../themes/themes.dart';

class AboutMeSection extends StatelessWidget {
  const AboutMeSection({
    super.key,
    required this.maxWidth,
    required this.aboutMe,
  });

  final double maxWidth;
  final List<Map> aboutMe;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 800),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Container(
          padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
          color: CustomColor.bgLiht1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const AutoSizeText(
                textAlign: TextAlign.center,
                'Sobre mí',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: CustomColor.whitePrimary,
                ),
              ),
              const SizedBox(height: 30),
              for (int i = 0; i < aboutMe.length; i++) ...[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: AutoSizeText(
                        aboutMe[i]['aboutme'],
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: CustomColor.textFieldBg,
                          fontWeight: FontWeight.bold,
                          fontSize: maxWidth <= 350 ? 14 : 16.0,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Container(
                      clipBehavior: Clip.antiAlias,
                      height: 300,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 6,
                            offset: const Offset(4, 4),
                          ),
                        ],
                      ),
                      child: Image.asset(
                        'assets/imgs/perfil/graduacion.jpg',
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 30),
              ],
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 800),
                child: const Divider(),
              ),
              const SizedBox(height: 15),

              // Icon Buttons Links
              Wrap(
                spacing: 12,
                runSpacing: 12,
                alignment: WrapAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      js.context.callMethod('open', [SnsLinks.github]);
                    },
                    child: Image.asset(
                      'assets/contacts/github.png',
                      width: 24,
                      color: CustomColor.whitePrimary,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      js.context.callMethod('open', [SnsLinks.linkedin]);
                    },
                    child: Image.asset(
                      'assets/contacts/linkedin.png',
                      width: 24,
                      color: CustomColor.whitePrimary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
