// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/widgets.dart';
import 'package:web_portfolio/src/constants/constants.dart';
import 'package:web_portfolio/src/widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          key: scaffoldKey,
          endDrawer: constraints.maxWidth >= kMinDestopWith
              ? null
              : const MobileDrawer(),
          backgroundColor: CustomColor.scaffoldBg,
          body: ListView(
            scrollDirection: Axis.vertical,
            children: [
              //Main
              if (constraints.maxWidth >= kMinDestopWith)
                const HeaderWeb()
              else
                HeaderMobile(
                  onLogoTap: () {},
                  onMenuTap: () {
                    scaffoldKey.currentState?.openEndDrawer();
                  },
                ),
              //Presentation
              if (constraints.maxWidth >= kMinDestopWith)
                const MainDesktop()
              else
                const MainMobile(),
              //Skill
              Container(
                width: screenWidth,
                padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
                color: CustomColor.bgLiht1,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // title
                    const AutoSizeText(
                      'What I can do',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: CustomColor.whitePrimary,
                      ),
                    ),
                    const SizedBox(height: 50),
                    //Platforms and Skill
                    if (constraints.maxWidth >= kMedDestopWith)
                      const SkillDesktop()
                    else
                      const SkillMobile()
                  ],
                ),
              ),
              const SizedBox(height: 30),
              // PROJECT
              ProjectSection(screenWidth: screenWidth),

              //Contact
              Container(
                padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
                color: CustomColor.bgLiht1,
                child: Column(
                  children: [
                    //Title
                    const AutoSizeText(
                      'Get in touch',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: CustomColor.whitePrimary,
                      ),
                    ),
                    const SizedBox(height: 50),
                    const Row(
                      children: [
                        //Name
                        Flexible(
                          child: CustomTextField(
                            hintText: 'Your name',
                          ),
                        ),
                        SizedBox(width: 15),
                        //Email
                        Flexible(
                          child: CustomTextField(
                            hintText: 'Your emial',
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 15),
                    //Message
                    const CustomTextField(
                      hintText: 'Your message',
                      maxLine: 10,
                    ),
                    //Send Button
                    ElevatedButton(
                        onPressed: () {}, child: const Text('Get in touch'))
                  ],
                ),
              ),
              //Footer
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                width: double.maxFinite,
                alignment: Alignment.center,
                child: const AutoSizeText(
                  'Made by Oscar Ramirez with flutter 3.22',
                ),
              )
            ],
          ),
          floatingActionButton: CustomFloatActionButton(
            onLanguageTap: () {
              print('Language');
            },
            onModoDarkTap: () {
              print('Modo Dark');
            },
          ),
        );
      },
    );
  }
}
