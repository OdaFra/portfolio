// ignore_for_file: sized_box_for_whitespace

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
              height: 500,
              width: double.maxFinite,
              color: Colors.blueGrey.shade700,
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
        floatingActionButton: const CustomFloatActionButton(),
      );
    });
  }
}
