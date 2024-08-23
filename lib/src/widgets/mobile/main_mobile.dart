import 'package:flutter/material.dart';
import 'package:web_portfolio/src/widgets/widgets.dart';

import '../../themes/themes.dart';

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
      constraints: const BoxConstraints(minHeight: 450.0),
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
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 350),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 25),
                CustomPresentationAM(maxWidth: 350),
                CustomButtonContacts()
              ],
            ),
          )
        ],
      ),
    );
  }
}
