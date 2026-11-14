import 'package:checkpoint/core/theme/app_paddings.dart';
import 'package:material_ui/material_ui.dart';

class AppTabBar extends StatelessWidget {
  const AppTabBar({super.key, required this.tabs, required this.controller});

  final List<Tab> tabs;
  final TabController controller;

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.of(context);

    return Container(
      clipBehavior: .hardEdge,
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHigh,
        borderRadius: .circular(20),
        border: Border.all(color: colorScheme.outlineVariant, width: 1),
      ),
      padding: const .all(AppPaddings.xs),
      child: TabBar(tabs: tabs, controller: controller),
    );
  }
}
