import 'package:flutter/material.dart';

import '../constants/constants.dart';

class MainMobile extends StatelessWidget {
  const MainMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    return Container(
      height: screenHeight,
      constraints: const BoxConstraints(minHeight: 560.0),
      child: Column(
        children: [
          SizedBox(height: (screenHeight * 0.25) / 2),
          CircleAvatar(
            radius: (screenWidth * 0.40) / 1.5,
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
                  'assets/imgs/astrodev.jpg',
                  width: screenWidth,
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          const Text(
            "Hi, \nI'm Oscar Ramirez\n A Software Engineer",
            style: TextStyle(
              color: CustomColor.witheSecondary,
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 15),
          SizedBox(
            width: 190,
            height: 40,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: CustomColor.yellowPrimary,
              ),
              onPressed: () {},
              child: const Text(
                'Get in touch',
                style: TextStyle(
                  color: CustomColor.whitePrimary,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
