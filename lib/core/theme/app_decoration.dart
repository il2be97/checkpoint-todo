import 'package:checkpoint/core/theme/color_scheme.dart';
import 'package:flutter/material.dart';

abstract class AppDecoration {
  static BoxDecoration itemContainer(BuildContext context) {
    final colorScheme = ColorScheme.of(context);
    return BoxDecoration(
      color: colorScheme.surfaceAction,
      borderRadius: .circular(11),
    );
  }

  static BoxDecoration pillDecoration(BuildContext context) {
    final colorScheme = ColorScheme.of(context);
    return BoxDecoration(
      color: colorScheme.surfaceContainer,
      borderRadius: .circular(100),
    );
  }
}
