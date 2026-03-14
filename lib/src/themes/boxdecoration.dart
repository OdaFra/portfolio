import 'package:flutter/material.dart';

import 'themes.dart';

BoxDecoration kHederDecoration = const BoxDecoration(
  border: Border(
    bottom: BorderSide(color: CustomColor.panelBorder, width: 1.0),
  ),
  gradient: LinearGradient(
    colors: [Colors.transparent, CustomColor.panelBg],
  ),
);
