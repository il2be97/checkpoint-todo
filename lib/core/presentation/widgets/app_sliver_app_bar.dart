import 'package:checkpoint/core/theme/app_paddings.dart';
import 'package:flutter/material.dart';

class AppSliverAppBar extends StatelessWidget {
  const AppSliverAppBar({
    required this.title,
    this.subtitle,
    this.actions = const [],
    this.pinned = true,
    super.key,
  });

  final String title;
  final String? subtitle;
  final bool pinned;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final trailing = List.generate(actions.length, (index) {
      return Padding(
        padding: .only(
          right: index == actions.length - 1 ? AppPaddings.m : AppPaddings.s,
        ),
        child: actions[index],
      );
    });

    return SliverAppBar(
      pinned: pinned,
      flexibleSpace: Padding(
        padding: const .all(AppPaddings.m),
        child: Column(
          crossAxisAlignment: .start,
          mainAxisAlignment: .end,
          children: [
            if (subtitle != null) Text(subtitle!, style: textTheme.labelSmall),
            Text(title, style: textTheme.headlineMedium),
          ],
        ),
      ),
      toolbarHeight: 80,
      actions: trailing,
    );
  }
}
