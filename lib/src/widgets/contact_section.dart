import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../themes/themes.dart';
import 'widgets.dart';
import 'dart:js' as js;

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Container(
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
            // ConstrainedBox(
            //     constraints: const BoxConstraints(
            //         maxWidth: isDesktopSize, maxHeight: 120),
            //     child: LayoutBuilder(
            //       builder: (context, constraints) {
            //         if (constraints.maxWidth <= isMobileSize) {
            //           return buildNameEmailFieldMobile();
            //         }
            //         return buildNameEmailFieldDesktop();
            //       },
            //     )),
            const SizedBox(height: 15),
            //Message
            // ConstrainedBox(
            //   constraints: const BoxConstraints(maxWidth: isDesktopSize),
            //   child: const CustomTextField(
            //     hintText: 'Message',
            //     maxLine: 10,
            //   ),
            // ),
            const SizedBox(height: 15),
            //Send Button
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 700),
              child: SizedBox(
                width: double.maxFinite,
                height: 45,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: CustomColor.yellowPrimary,
                  ),
                  onPressed: () {},
                  child: const AutoSizeText(
                    'Get in touch',
                    style: TextStyle(
                      color: CustomColor.whitePrimary,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 300),
              child: const Divider(),
            ),
            const SizedBox(height: 15),
            //Icon Buttons Links
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
                    'assets/projects/github.png',
                    width: 24,
                    color: CustomColor.whitePrimary,
                  ),
                ),
                InkWell(
                  onTap: () {
                    js.context.callMethod('open', [SnsLinks.linkedin]);
                  },
                  child: Image.asset(
                    'assets/projects/linkedin.png',
                    width: 24,
                    color: CustomColor.whitePrimary,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Row buildNameEmailFieldDesktop() {
    return const Row(
      children: [
        //Name
        Flexible(
          child: CustomTextField(
            hintText: 'Full name',
          ),
        ),
        SizedBox(width: 15),
        //Email
        Flexible(
          child: CustomTextField(
            hintText: 'Email address',
          ),
        )
      ],
    );
  }

  Column buildNameEmailFieldMobile() {
    return const Column(
      children: [
        //Name
        Flexible(
          child: CustomTextField(
            hintText: 'Full name',
          ),
        ),
        SizedBox(height: 15),
        //Email
        Flexible(
          child: CustomTextField(
            hintText: 'Email address',
          ),
        )
      ],
    );
  }
}
