import 'package:checkpoint/core/theme/color_scheme.dart';
import 'package:flutter/material.dart';

abstract class AppDecoration {
  static BoxDecoration cardContainer(BuildContext context) {
    final colorScheme = ColorScheme.of(context);
    return BoxDecoration(
      color: colorScheme.surfaceContainer,
      borderRadius: .circular(20),
      border: Border.all(color: colorScheme.outlineVariant, width: 1),
    );
  }

  static BoxDecoration itemContainer(BuildContext context) {
    final colorScheme = ColorScheme.of(context);
    return BoxDecoration(
      color: colorScheme.surfaceAction,
      borderRadius: .circular(11),
    );
  }
}
