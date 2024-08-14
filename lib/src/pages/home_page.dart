// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:web_portfolio/src/constants/constants.dart';
import 'package:web_portfolio/src/widgets/widgets.dart';
import '../themes/themes.dart';
import '../widgets/desktop/desktop.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
  final GlobalKey sizedBoxKey = GlobalKey();
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
          appBar: (constraints.maxWidth >= isMobileSize)
              ? PreferredSize(
                  preferredSize: const Size.fromHeight(55.0),
                  child: HeaderDestkopAppBar(
                    onNavTitleTap: () => scrollBackToHome(sizedBoxKey),
                    onNavMenuTap: (int navIndex) => scrollToSection(navIndex),
                  ),
                )
              : PreferredSize(
                  preferredSize: const Size.fromHeight(55.0),
                  child: HeaderMobile(
                    onNavTitleTap: () => scrollBackToHome(sizedBoxKey),
                    onNavMenuTap: () =>
                        scaffoldKey.currentState?.openEndDrawer(),
                  ),
                ),
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
                SizedBox(key: sizedBoxKey),
                //Presentation
                if (constraints.maxWidth >= isMobileSize)
                  const MainDesktop()
                else
                  const MainMobile(),
                //Skill
                Container(
                  key: navbarKeys[0],
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
                  key: navbarKeys[1],
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
                ProjectSection(screenWidth: screenWidth, key: navbarKeys[2]),

                //Contact
                ContactSection(key: navbarKeys[3]),
                //Footer
                const FooterSection(),
              ],
            ),
          ),
          floatingActionButton: CustomFloatActionButton(
            onPress: () => scrollBackToHome(sizedBoxKey),
          ),
        );
      },
    );
  }

  void scrollToSection(int navIndex) {
    final key = navbarKeys[navIndex];
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void scrollBackToHome(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }
}
