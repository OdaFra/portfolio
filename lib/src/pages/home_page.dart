import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:redisenho_portfolio/src/constants/constants.dart';
import 'package:redisenho_portfolio/src/pages/mobile/mobile_drawer.dart';
import 'package:redisenho_portfolio/src/widgets/widgets.dart';

import '../themes/colors.dart';
import '../widgets/sidebar_navigation.dart';
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
  final GlobalKey sizedBoxKey = GlobalKey();
  final List<GlobalKey> navbarKeys = List.generate(
    6,
    (index) => GlobalKey(),
  );
  int _currentNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= isMobileSize;

        return Scaffold(
          key: scaffoldKey,
          backgroundColor: CustomColor.scaffoldBg,
          appBar: isDesktop
              ? null
              : PreferredSize(
                  preferredSize: const Size.fromHeight(60.0),
                  child: HeaderMobile(
                    onNavTitleTap: () => scrollBackToHome(sizedBoxKey),
                    onNavMenuTap: () =>
                        scaffoldKey.currentState?.openEndDrawer(),
                  ),
                ),
          endDrawer: isDesktop
              ? null
              : MobileDrawer(
                  onNavItemTap: (int navIndex) {
                    scaffoldKey.currentState?.closeEndDrawer();
                    scrollToSection(navIndex);
                  },
                ),
          body: Stack(
            children: [
              // Glowing Orbs Background (Premium Visuals)
              Positioned(
                top: -150,
                right: -100,
                child: Container(
                  width: 500,
                  height: 500,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: CustomColor.accentPrimary.withOpacity(0.15),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                    child: Container(color: Colors.transparent),
                  ),
                ),
              ),
              Positioned(
                bottom: -200,
                left: -100,
                child: Container(
                  width: 600,
                  height: 600,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: CustomColor.accentSecondary.withOpacity(0.1),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 120, sigmaY: 120),
                    child: Container(color: Colors.transparent),
                  ),
                ),
              ),

              // Scrollable Content
              Container(
                margin: EdgeInsets.only(left: isDesktop ? 100.0 : 0),
                child: CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  slivers: [
                    SliverToBoxAdapter(child: SizedBox(key: sizedBoxKey)),
                    // 1. Presentation
                    SliverToBoxAdapter(
                      child: SizedBox(
                        key: navbarKeys[0],
                        child: isDesktop
                            ? const MainDesktop()
                            : const MainMobile(),
                      ),
                    ),
                    const SliverToBoxAdapter(child: SizedBox(height: 100)),
                    // 2. Skills
                    SliverToBoxAdapter(
                      child: ProfessionalSkills(
                        navbarKeys: navbarKeys,
                        screenWidth: screenWidth,
                        constraints: constraints,
                      ),
                    ),
                    const SliverToBoxAdapter(child: SizedBox(height: 100)),
                    // 3. Experience
                    SliverToBoxAdapter(
                      child: WorkExperience(
                        navbarKeys: navbarKeys,
                        screenWidth: screenWidth,
                        constraints: constraints,
                      ),
                    ),
                    const SliverToBoxAdapter(child: SizedBox(height: 100)),
                    // Featured Project (Secreto / Próximamente)
                    SliverToBoxAdapter(
                      child: FeaturedProjectSectionV2(
                        key: navbarKeys[3],
                        screenWidth: screenWidth,
                        constraints: constraints,
                      ),
                    ),
                    const SliverToBoxAdapter(child: SizedBox(height: 100)),
                    // 4. Projects
                    SliverToBoxAdapter(
                      child: ProjectSection(
                        screenWidth: screenWidth,
                        key: navbarKeys[4],
                      ),
                    ),
                    const SliverToBoxAdapter(child: SizedBox(height: 100)),
                    // 5. About Me
                    SliverToBoxAdapter(
                      child: AboutMeSection(
                        key: navbarKeys[5],
                        screenWidth: screenWidth,
                        constraints: constraints,
                        aboutMe: aboutMeItems,
                      ),
                    ),
                    const SliverToBoxAdapter(child: FooterSection()),
                  ],
                ),
              ),

              // Floating Glass Sidebar for Desktop
              if (isDesktop)
                Positioned(
                  left: 20,
                  top: 0,
                  bottom: 0,
                  child: Center(
                    child: SidebarNavigation(
                      selectedIndex: _currentNavIndex,
                      onItemSelected: (index) {
                        setState(() => _currentNavIndex = index);
                        scrollToSection(index);
                      },
                    ),
                  ),
                ),
            ],
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
      duration: const Duration(milliseconds: 800),
      curve: Curves.fastOutSlowIn,
    );
  }

  void scrollBackToHome(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 800),
        curve: Curves.fastOutSlowIn,
      );
    }
  }
}
