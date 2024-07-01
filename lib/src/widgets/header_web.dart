import 'package:flutter/material.dart';

import 'package:web_portfolio/src/widgets/widgets.dart';

import '../constants/constants.dart';
import '../styles/styles.dart';

class HeaderWeb extends StatelessWidget {
  const HeaderWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      width: double.maxFinite,
      decoration: kHederDecoration,
      child: Row(
        children: [
          const SizedBox(width: 50),
          Center(
            child: SiteLogo(
              onTap: () {},
            ),
          ),
          const Spacer(),
          for (int i = 0; i < navTitles.length; i++)
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  navTitles[i],
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: CustomColor.whitePrimary,
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
