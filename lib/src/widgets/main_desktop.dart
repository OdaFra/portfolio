import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'dart:js' as js;

import '../constants/constants.dart';
import '../themes/colors.dart';

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
      constraints: const BoxConstraints(minHeight: 450),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: (screenHeight * 0.40) / 1.5,
          ),
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
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    "Hey, soy Oscar Ramirez",
                    style: TextStyle(
                      color: CustomColor.whitePrimary,
                      fontWeight: FontWeight.w800,
                      fontSize: 26.0,
                      height: 1.5,
                      letterSpacing: 4,
                    ),
                  ),
                  SizedBox(height: 20),
                  AutoSizeText(
                    "+3 años de experiencia como desarrollador, \nobteniendo un sólido conocimiento técnico y conceptual del ciclo \nde vida de desarrollo de software, como la implementación limpia",
                    style: TextStyle(
                      color: CustomColor.textFieldBg,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 25),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 450),
            child: Wrap(
              spacing: 8,
              runSpacing: 4,
              direction: Axis.horizontal,
              children: [
                for (int i = 0; i < contactsItems.length; i++)
                  InkWell(
                    onTap: () {
                      js.context
                          .callMethod('open', [contactsItems[i]['contact']]);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 150,
                      decoration: BoxDecoration(
                        color: CustomColor.yellowPrimary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 14.0,
                          vertical: 6.0,
                        ),
                        leading: Image.asset(
                          contactsItems[i]['icon'],
                          color: CustomColor.scaffoldBg,
                          width: 22.0,
                        ),
                        title: AutoSizeText(
                          contactsItems[i]['title'],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: CustomColor.scaffoldBg,
                          ),
                        ),
                      ),
                    ),
                  )
              ],
            ),
          ),
          // SizedBox(
          //   width: 250,
          //   height: 45,
          //   child: ElevatedButton(
          //     style: ElevatedButton.styleFrom(
          //       backgroundColor: CustomColor.yellowPrimary,
          //     ),
          //     onPressed: () {},
          //     child: const AutoSizeText(
          //       'Get in touch',
          //       style: TextStyle(
          //         color: CustomColor.whitePrimary,
          //         fontWeight: FontWeight.bold,
          //         fontSize: 20.0,
          //       ),
          //     ),
          //   ),
          // ),
          const Spacer()
        ],
      ),
    );
  }
}
