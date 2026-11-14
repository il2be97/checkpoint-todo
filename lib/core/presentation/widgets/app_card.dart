import 'package:checkpoint/core/theme/app_paddings.dart';
import 'package:material_ui/material_ui.dart';

enum AppCardType { standart, active }

class AppCard extends StatelessWidget {
  const AppCard({
    super.key,
    required this.child,
    this.paddings,
    this.type = .standart,
  });

  final Widget child;
  final EdgeInsets? paddings;
  final AppCardType type;

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.of(context);
    final shape = switch (type) {
      AppCardType.standart => null,
      AppCardType.active => RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
        side: BorderSide(color: colorScheme.primary, width: 1),
      ),
    };

    return Card(
      shape: shape,
      child: Padding(
        padding: paddings ?? const EdgeInsets.all(AppPaddings.m),
        child: child,
      ),
    );
  }
}
