import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SiteLogo extends ConsumerWidget {
  const SiteLogo({
    super.key,
    this.onPressed,
  });
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleColor = Theme.of(context).colorScheme.primary;
    final iconColor = Theme.of(context).colorScheme.onPrimary;

    return Padding(
      padding: const EdgeInsets.only(left: 30.0),
      child: TextButton(
        onPressed: onPressed,
        child: Row(
          children: [
            AutoSizeText(
              '< ',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: iconColor,
              ),
            ),
            AutoSizeText(
              'Oscar Ramirez',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: titleColor,
              ),
            ),
            AutoSizeText(
              ' />',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: iconColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
