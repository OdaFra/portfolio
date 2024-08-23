import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:web_portfolio/src/widgets/widgets.dart';

import '../themes/themes.dart';

class MainMobile extends StatelessWidget {
  const MainMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
      height: screenHeight,
      constraints: const BoxConstraints(minHeight: 460.0),
      child: Column(
        children: [
          SizedBox(height: (screenHeight * 0.15) / 2),
          CircleAvatar(
            backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
            radius: (screenWidth * 0.35) / 2.5,
            child: ShaderMask(
              shaderCallback: (bounds) {
                return LinearGradient(colors: [
                  CustomColor.scaffoldBg.withOpacity(0.5),
                  CustomColor.scaffoldBg.withOpacity(0.5)
                ]).createShader(bounds);
              },
              blendMode: BlendMode.srcATop,
              child: ClipOval(
                child: Image.asset(
                  'assets/imgs/perfilgithub.jpg',
                  width: screenWidth,
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 25),
              const AutoSizeText(
                "Hey, soy Oscar Ramirez",
                style: TextStyle(
                  color: CustomColor.whitePrimary,
                  fontWeight: FontWeight.w800,
                  fontSize: 16.0,
                  height: 1.5,
                  letterSpacing: 3,
                ),
              ),
              const SizedBox(height: 20),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 350),
                child: const Center(
                  child: AutoSizeText(
                    "+3 años de experiencia como desarrollador, obteniendo un sólido conocimiento técnico y conceptual del ciclo de vida de desarrollo de software, como la implementación de arquitectura limpia.",
                    style: TextStyle(
                      color: CustomColor.textFieldBg,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const CustomButtonContacts()
            ],
          )
        ],
      ),
    );
  }
}
