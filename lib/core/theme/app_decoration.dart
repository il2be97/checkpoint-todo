import 'package:flutter/material.dart';

abstract class AppDecoration {
  static BoxDecoration forCard(BuildContext context) {
    final colorScheme = ColorScheme.of(context);
    return BoxDecoration(
      color: colorScheme.surfaceContainer,
      borderRadius: .circular(20),
      border: Border.all(color: colorScheme.outlineVariant, width: 1),
    );
  }
}
