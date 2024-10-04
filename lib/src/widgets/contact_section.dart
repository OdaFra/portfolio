import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../themes/themes.dart';
import 'widgets.dart';
import 'dart:js' as js;

class ContactSection extends StatelessWidget {
  const ContactSection({super.key, required this.maxWidth});
  final double maxWidth;
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
            children: [
              //Title
              const AutoSizeText(
                'Sobre mí',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: CustomColor.whitePrimary,
                ),
              ),
              const SizedBox(height: 50),

              const SizedBox(height: 15),
              AutoSizeText(
                textAlign: maxWidth <= 350 ? TextAlign.center : TextAlign.start,
                "Me llamo Oscar y soy un profesional con +10 años de experiencia en la industria de las Telecomunicaciones, con amplios conocimientos técnicos en diferentes tecnologías y gran capacidad analítica. Mis años de experiencia, incluyen un alto nivel de liderazgo, gestión de equipos, planificación y administración del personal técnico como gestión de proyectos. 👇 Actualmente contribuyó en el desarrollo de la App de Tigo Money, la cual se encuentra disponible en los siguientes paises: - Paraguay 🇵🇾, - Bolivia 🇧🇴 - Honduras 🇭🇳 - Guatemala 🇬🇹 y - El Salvador 🇸🇻",
                style: TextStyle(
                  color: CustomColor.textFieldBg,
                  fontWeight: FontWeight.bold,
                  fontSize: maxWidth <= 350 ? 14 : 16.0,
                ),
              ),
              const SizedBox(height: 30),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 300),
                child: const Divider(),
              ),
              const SizedBox(height: 15),
              //Icon Buttons Links
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
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row buildNameEmailFieldDesktop() {
    return const Row(
      children: [
        //Name
        Flexible(
          child: CustomTextField(
            hintText: 'Full name',
          ),
        ),
        SizedBox(width: 15),
        //Email
        Flexible(
          child: CustomTextField(
            hintText: 'Email address',
          ),
        )
      ],
    );
  }

  Column buildNameEmailFieldMobile() {
    return const Column(
      children: [
        //Name
        Flexible(
          child: CustomTextField(
            hintText: 'Full name',
          ),
        ),
        SizedBox(height: 15),
        //Email
        Flexible(
          child: CustomTextField(
            hintText: 'Email address',
          ),
        )
      ],
    );
  }
}
