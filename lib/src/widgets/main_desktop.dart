import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';

class MainDesktop extends StatelessWidget {
  const MainDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      height: screenHeight / 1.2,
      constraints: const BoxConstraints(minHeight: 350),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const AutoSizeText(
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
                width: 250,
                height: 45,
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
              )
            ],
          ),
          CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: (screenWidth * 0.26) / 2,
            child: ClipOval(
              child: Image.asset(
                'assets/imgs/perfilgithub.jpg',
                // width: (size.width * 0.5) / 2,
              ),
            ),
          )
        ],
      ),
    );
  }
}
