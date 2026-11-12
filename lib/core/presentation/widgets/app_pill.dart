import 'package:checkpoint/core/theme/app_paddings.dart';
import 'package:flutter/material.dart';

class AppPill extends StatelessWidget {
  const AppPill({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.of(context);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Padding(
        padding: const .symmetric(
          vertical: AppPaddings.xs,
          horizontal: AppPaddings.s,
        ),
        child: child,
      ),
    );
  }
}
