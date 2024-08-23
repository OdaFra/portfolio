import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../themes/colors.dart';
import '../widgets.dart';

class MainDesktop extends StatelessWidget {
  const MainDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      height: screenHeight / 1,
      constraints: const BoxConstraints(minHeight: 550),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: (screenHeight * 0.40) / 1.5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: (screenWidth * 0.10) / 1.7,
                child: ClipOval(
                  child: Image.asset(
                    'assets/imgs/perfilgithub.jpg',
                    // width: (size.width * 0.5) / 2,
                  ),
                ),
              ),
              const SizedBox(width: 30),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 450),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      "Hey, soy Oscar Ramirez",
                      style: TextStyle(
                        color: CustomColor.whitePrimary,
                        fontWeight: FontWeight.w800,
                        fontSize: 26.0,
                        height: 1.5,
                        letterSpacing: 3,
                      ),
                    ),
                    SizedBox(height: 20),
                    AutoSizeText(
                      "+3 años de experiencia como desarrollador, obteniendo un sólido conocimiento técnico y conceptual del ciclo de vida de desarrollo de software, como la implementación de arquitectura limpia.",
                      style: TextStyle(
                        color: CustomColor.textFieldBg,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(height: 25),
                    AutoSizeText(
                      "Contáctame",
                      style: TextStyle(
                        color: CustomColor.whitePrimary,
                        fontWeight: FontWeight.w400,
                        fontSize: 14.0,
                        height: 1.5,
                        letterSpacing: 3,
                      ),
                    ),
                    Divider(
                      color: CustomColor.grey4Color,
                    ),
                    SizedBox(height: 10),
                    CustomButtonContacts(),
                  ],
                ),
              )
            ],
          ),
          const Spacer()
        ],
      ),
    );
  }
}
