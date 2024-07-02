import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../constants/constants.dart';

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
      constraints: const BoxConstraints(minHeight: 560.0),
      child: Column(
        children: [
          SizedBox(height: (screenHeight * 0.15) / 2),
          CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: (screenWidth * 0.35) / 1.5,
            child: ShaderMask(
              shaderCallback: (bounds) {
                return LinearGradient(colors: [
                  CustomColor.scaffoldBg.withOpacity(0.6),
                  CustomColor.scaffoldBg.withOpacity(0.6)
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
          const SizedBox(height: 30),
          const AutoSizeText(
            "Hi, \nI'm Oscar Ramirez\n A Software Engineer",
            style: TextStyle(
              color: CustomColor.witheSecondary,
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 15),
          Flexible(
            child: SizedBox(
              width: 180,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: CustomColor.yellowPrimary,
                ),
                onPressed: () {},
                child: const AutoSizeText(
                  'Get in touch',
                  style: TextStyle(
                    color: CustomColor.whitePrimary,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
