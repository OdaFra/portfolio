import 'package:flutter/material.dart';

import 'package:web_portfolio/src/constants/constants.dart';
import 'package:web_portfolio/src/pages/mobile/mobile_drawer.dart';
import 'package:web_portfolio/src/widgets/widgets.dart';
import '../themes/colors.dart';
import 'desktop/desktop.dart';
import 'desktop/main_desktop.dart';
import 'mobile/header_mobile.dart';
import 'mobile/main_mobile.dart';

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
                Container(color: CustomColor.grey5Color, height: 1.0),
                ProfessionalSkills(
                  navbarKeys: navbarKeys,
                  screenWidth: screenWidth,
                  constraints: constraints,
                ),
                Container(color: CustomColor.grey5Color, height: 1.0),
                //Exprience
                WorkExperience(
                  navbarKeys: navbarKeys,
                  screenWidth: screenWidth,
                  constraints: constraints,
                ),
                Container(color: CustomColor.grey5Color, height: 1.0),
                // Projects
                ProjectSection(
                  screenWidth: screenWidth,
                  key: navbarKeys[2],
                ),
                Container(color: CustomColor.grey5Color, height: 1.0),
                //About me
                AboutMeSection(
                  key: navbarKeys[3],
                  screenWidth: screenWidth,
                  constraints: constraints,
                  aboutMe: aboutMeItems,
                ),
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
