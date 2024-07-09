// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:web_portfolio/src/constants/constants.dart';
import 'package:web_portfolio/src/utils/project_utils.dart';
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
            // //Main
            // if (constraints.maxWidth >= kMinDestopWith)
            //   const HeaderWeb()
            // else
            //   HeaderMobile(
            //     onLogoTap: () {},
            //     onMenuTap: () {
            //       scaffoldKey.currentState?.openEndDrawer();
            //     },
            //   ),
            // //Presentation
            // if (constraints.maxWidth >= kMinDestopWith)
            //   const MainDesktop()
            // else
            //   const MainMobile(),
            // //Skill
            // Container(
            //   width: screenWidth,
            //   padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
            //   color: CustomColor.bgLiht1,
            //   child: Column(
            //     mainAxisSize: MainAxisSize.min,
            //     children: [
            //       //title
            //       const AutoSizeText(
            //         'What I can do',
            //         style: TextStyle(
            //           fontSize: 24,
            //           fontWeight: FontWeight.bold,
            //           color: CustomColor.whitePrimary,
            //         ),
            //       ),
            //       const SizedBox(height: 50),
            //       //Platforms and Skill
            //       if (constraints.maxWidth >= kMedDestopWith)
            //         const SkillDesktop()
            //       else
            //         const SkillMobile()
            //     ],
            //   ),
            // ),

            //Work Project
            Container(
              width: screenWidth,
              padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
              child: Column(
                children: [
                  //Work Project title
                  const AutoSizeText(
                    'Work projects',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: CustomColor.whitePrimary,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Wrap(
                    spacing: 25,
                    runSpacing: 25,
                    children: [
                      for (int i = 0; i < workProjectUtils.length; i++)
                        ProjectsCardWidget(
                          project: workProjectUtils[i],
                        ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  //Hobby Project
                  const AutoSizeText(
                    'Hobby projects',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: CustomColor.whitePrimary,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Wrap(
                    spacing: 25,
                    runSpacing: 25,
                    children: [
                      for (int i = 0; i < hobbyProjectUtils.length; i++)
                        ProjectsCardWidget(
                          project: hobbyProjectUtils[i],
                        ),
                    ],
                  ),
                ],
              ),
            ),

            //Contact
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
