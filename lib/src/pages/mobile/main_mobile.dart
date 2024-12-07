import 'package:flutter/material.dart';
import 'package:web_portfolio/src/constants/constants.dart';
import 'package:web_portfolio/src/widgets/widgets.dart';

class MainMobile extends StatelessWidget {
  const MainMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
      height: screenHeight,
      constraints: const BoxConstraints(minHeight: 450.0),
      child: Column(
        children: [
          SizedBox(height: (screenHeight * 0.15) / 2),
          Container(
            clipBehavior: Clip.antiAlias,
            height: 250,
            width: 180,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: const Offset(4, 4),
                  ),
                ]),
            child: Image.asset(
              'assets/imgs/perfil/perfilgithub.jpeg',
            ),
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 350),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 25),
                CustomPresentationAM(
                  maxWidth: 350,
                  aboutMe: aboutMeItems,
                ),
                CustomButtonContacts()
              ],
            ),
          )
        ],
      ),
    );
  }
}
