// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:web_portfolio/src/constants/constants.dart';
import 'package:web_portfolio/src/widgets/widgets.dart';
import '../themes/themes.dart';

class HomePage1 extends StatefulWidget {
  const HomePage1({super.key});

  @override
  State<HomePage1> createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
  final List<GlobalKey> navbarKeys = List.generate(
    5,
    (index) => GlobalKey(),
  );

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          key: scaffoldKey,
          endDrawer: constraints.maxWidth >= isMobileSize
              ? null
              : MobileDrawer(
                  onNavItemTap: (int navIndex) {
                    scaffoldKey.currentState?.closeEndDrawer();
                    scrollToSection(navIndex);
                  },
                ),
          backgroundColor: CustomColor.scaffoldBg,
          body: SingleChildScrollView(
            controller: scrollController,
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(key: navbarKeys[0]),
                //Main
                if (constraints.maxWidth >= isMobileSize)
                  HeaderDeskrop(
                    onNavMenuTap: (int navIndex) {
                      scrollToSection(navIndex);
                    },
                  )
                else
                  HeaderMobile(
                    onNavTitleTap: () {},
                    onNavMenuTap: () {
                      scaffoldKey.currentState?.openEndDrawer();
                    },
                  ),
                //Presentation
                if (constraints.maxWidth >= isMobileSize)
                  const MainDesktop()
                else
                  const MainMobile(),
                //Skill
                Container(
                  key: navbarKeys[1],
                  width: screenWidth,
                  padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
                  color: CustomColor.bgLiht1,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // title
                      const AutoSizeText(
                        'Professional Skills',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: CustomColor.whitePrimary,
                        ),
                      ),
                      const SizedBox(height: 50),
                      //Platforms and Skill
                      if (constraints.maxWidth >= isDesktopSize)
                        const SkillDesktop()
                      else
                        const SkillMobile()
                    ],
                  ),
                ),

                //Exprience
                Container(
                  key: navbarKeys[2],
                  width: screenWidth,
                  padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
                  color: CustomColor.bgLiht1,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // title
                      const AutoSizeText(
                        'Resumen',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: CustomColor.whitePrimary,
                        ),
                      ),
                      const SizedBox(height: 50),
                      //Platforms and Skill
                      if (constraints.maxWidth >= isDesktopSize)
                        const SkillDesktop()
                      else
                        const SkillMobile()
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                // PROJECT
                ProjectSection(screenWidth: screenWidth, key: navbarKeys[3]),

                //Contact
                ContactSection(key: navbarKeys[4]),
                //Footer
                const FooterSection(),
              ],
            ),
          ),
          // floatingActionButton: CustomFloatActionButton(
          //   onLanguageTap: () {},
          //   onModoDarkTap: () {},
          // ),
        );
      },
    );
  }

  void scrollToSection(int navIndex) {
    // if (navIndex == 4) {
    //   return;
    // }
    final key = navbarKeys[navIndex];
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
