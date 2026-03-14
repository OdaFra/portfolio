// ignore_for_file: avoid_web_libraries_in_flutter

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
    final containerColor = Theme.of(context).colorScheme.secondary;
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 450),
      child: Wrap(
        spacing: 8,
        runSpacing: 4,
        children: [
          for (int i = 0; i < contactsItems.length; i++)
            Semantics(
              button: true,
              child: MouseRegion(
                cursor: SystemMouseCursors.basic,
                child: GestureDetector(
                  onTap: () {
                    js.context
                        .callMethod('open', [contactsItems[i]['contact']]);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 150,
                    decoration: BoxDecoration(
                      color: containerColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 14.0),
                      leading: Image.asset(
                        contactsItems[i]['icon'],
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
                ),
              ),
            )
        ],
      ),
    );
  }
}
