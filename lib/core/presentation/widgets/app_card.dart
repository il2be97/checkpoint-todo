import 'package:checkpoint/core/theme/app_paddings.dart';
import 'package:material_ui/material_ui.dart';

class AppCard extends StatelessWidget {
  const AppCard({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final scheme = ColorScheme.of(context);
    return Card(
      color: scheme.surfaceContainerHigh,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
        side: BorderSide(color: scheme.outline, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppPaddings.m),
        child: child,
      ),
    );
  }
}
