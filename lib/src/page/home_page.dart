// ignore_for_file: sized_box_for_whitespace

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
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

    return LayoutBuilder(builder: (context, constraints) {
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
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  //title
                  AutoSizeText(
                    'What I can do',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: CustomColor.whitePrimary,
                    ),
                  ),
                  SizedBox(height: 50),
                  //Platforms and Skill
                  SkillDesktop()
                ],
              ),
            ),
            //Project
            Container(
              height: 500,
              width: double.maxFinite,
            ), //Contact
            Container(
              height: 500,
              width: double.maxFinite,
              color: Colors.blueGrey.shade700,
            ),
            //Footer
            Container(
              height: 500,
              width: double.maxFinite,
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
    });
  }
}
