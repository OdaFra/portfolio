import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'dart:js' as js;

import '../constants/constants.dart';
import '../themes/themes.dart';

class CustomButtonContacts extends StatelessWidget {
  const CustomButtonContacts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 450),
      child: Wrap(
        spacing: 8,
        runSpacing: 4,
        direction: Axis.horizontal,
        children: [
          for (int i = 0; i < contactsItems.length; i++)
            InkWell(
              onTap: () {
                js.context.callMethod('open', [contactsItems[i]['contact']]);
              },
              child: Container(
                alignment: Alignment.center,
                width: 150,
                decoration: BoxDecoration(
                  color: CustomColor.yellowPrimary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 14.0),
                  leading: Image.asset(
                    contactsItems[i]['icon'],
                    color: CustomColor.scaffoldBg,
                    width: 22.0,
                  ),
                  title: Center(
                    child: AutoSizeText(
                      contactsItems[i]['title'],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: CustomColor.scaffoldBg,
                      ),
                    ),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
