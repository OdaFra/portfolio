import 'dart:js' as js;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../constants/constants.dart';

class AboutMeSection extends StatelessWidget {
  const AboutMeSection({
    super.key,
    required this.screenWidth,
    required this.constraints,
    required this.aboutMe,
  });

  final double screenWidth;
  final BoxConstraints constraints;
  final List<Map> aboutMe;

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = screenWidth <= 450;

    return Container(
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
      child: Column(
        children: [
          const SizedBox(height: 30),
          AboutMeBody(
            screenWidth: screenWidth,
            aboutMe: aboutMe,
            isSmallScreen: isSmallScreen,
          ),
        ],
      ),
    );
  }
}

class AboutMeBody extends StatelessWidget {
  const AboutMeBody({
    super.key,
    required this.screenWidth,
    required this.aboutMe,
    required this.isSmallScreen,
  });

  final double screenWidth;
  final List<Map> aboutMe;
  final bool isSmallScreen;

  @override
  Widget build(BuildContext context) {
    final titleColor = Theme.of(context).colorScheme.onSecondary;
    final containerBgColor = Theme.of(context).colorScheme.surface;

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 800),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Container(
          width: screenWidth,
          padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
          color: containerBgColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AutoSizeText(
                textAlign: TextAlign.center,
                'Sobre mí',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: titleColor),
              ),
              const SizedBox(height: 30),
              for (int i = 0; i < aboutMe.length; i++) ...[
                isSmallScreen
                    ? AboutMeMobile(
                        imagePath: 'assets/imgs/perfil/graduacion.jpg',
                        aboutMeText: aboutMe[i]['aboutme'],
                        screenWidth: screenWidth,
                      )
                    : AboutMeDesktop(
                        imagePath: 'assets/imgs/perfil/graduacion.jpg',
                        aboutMeText: aboutMe[i]['aboutme'],
                        screenWidth: screenWidth,
                      ),
                const SizedBox(height: 30),
              ],
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 800),
                child: const Divider(),
              ),
              const SizedBox(height: 15),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                alignment: WrapAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      js.context.callMethod('open', [SnsLinks.github]);
                    },
                    child: Image.asset(
                      'assets/contacts/github.png',
                      width: 24,
                      color: titleColor,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      js.context.callMethod('open', [SnsLinks.linkedin]);
                    },
                    child: Image.asset('assets/contacts/linkedin.png',
                        width: 24, color: titleColor),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AboutMeMobile extends StatelessWidget {
  const AboutMeMobile({
    super.key,
    required this.imagePath,
    required this.aboutMeText,
    required this.screenWidth,
  });

  final String imagePath;
  final String aboutMeText;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    final titleColor = Theme.of(context).colorScheme.onSecondary;

    return Column(
      children: [
        SizedBox(
          height: 300,
          width: 200,
          child: _buildImage(),
        ),
        const SizedBox(height: 30),
        AutoSizeText(
          aboutMeText,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: titleColor,
            fontWeight: FontWeight.bold,
            fontSize: screenWidth <= 350 ? 14 : 16.0,
          ),
        ),
      ],
    );
  }

  Widget _buildImage() {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 6,
            offset: const Offset(4, 4),
          ),
        ],
      ),
      child: Image.asset(
        imagePath,
        fit: BoxFit.cover,
      ),
    );
  }
}

class AboutMeDesktop extends StatelessWidget {
  const AboutMeDesktop({
    super.key,
    required this.imagePath,
    required this.aboutMeText,
    required this.screenWidth,
  });

  final String imagePath;
  final String aboutMeText;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    final titleColor = Theme.of(context).colorScheme.onSecondary;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Flexible(
          child: AutoSizeText(
            aboutMeText,
            textAlign: TextAlign.start,
            style: TextStyle(
              color: titleColor,
              fontWeight: FontWeight.bold,
              fontSize: screenWidth <= 350 ? 12 : 14.0,
            ),
          ),
        ),
        const SizedBox(width: 20),
        Flexible(
          child: _buildImage(),
        ),
      ],
    );
  }

  Widget _buildImage() {
    return Container(
      clipBehavior: Clip.antiAlias,
      height: 300,
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 6,
            offset: const Offset(4, 4),
          ),
        ],
      ),
      child: Image.asset(
        imagePath,
        fit: BoxFit.cover,
      ),
    );
  }
}
