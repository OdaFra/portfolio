import 'package:flutter/material.dart';
import 'package:web_portfolio/src/constants/constants.dart';
import '../../widgets/widgets.dart';

class MainDesktop extends StatelessWidget {
  const MainDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
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
              const ProfileImage(
                imagePath: 'assets/imgs/perfil/perfilgithub.jpeg',
                height: 270,
                width: 200,
                blurRadius: 6,
                spreadRadius: 2,
              ),
              const SizedBox(width: 30),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 450),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomPresentationAM(
                      maxWidth: 450,
                      aboutMe: aboutMeItems,
                    ),
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
