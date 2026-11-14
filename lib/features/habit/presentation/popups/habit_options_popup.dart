import 'package:checkpoint/core/theme/app_decoration.dart';
import 'package:checkpoint/core/theme/app_paddings.dart';
import 'package:checkpoint/core/theme/color_scheme.dart';
import 'package:checkpoint/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:material_ui/material_ui.dart';

enum HabitOptions { edit, archive, delete }

// MARK: - Show Popup
Future<HabitOptions?> showHabitOptions(BuildContext context) async {
  return showModalBottomSheet(
    context: context,
    useRootNavigator: true,
    useSafeArea: true,
    isScrollControlled: true,
    builder: (context) => DraggableScrollableSheet(
      initialChildSize: 0.6,
      expand: false,
      minChildSize: 0.5,
      maxChildSize: 0.9,
      builder: (BuildContext context, ScrollController scrollController) =>
          _Popup(scrollController),
    ),
  );
}

class _Popup extends StatelessWidget {
  const _Popup(this._controller);

  final ScrollController _controller;

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);
    final colorScheme = ColorScheme.of(context);
    return SingleChildScrollView(
      controller: _controller,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppPaddings.l),
          child: Column(
            mainAxisSize: .min,
            crossAxisAlignment: .stretch,
            children: [
              // Divider
              const Center(
                child: SizedBox(width: 40, child: Divider(thickness: 5)),
              ),
              const SizedBox(height: AppPaddings.l),
              Text(
                LocaleKeys.habit_options_title.tr(),
                style: textTheme.headlineMedium?.copyWith(
                  color: colorScheme.onSurface,
                ),
              ),

              Text(
                LocaleKeys.habit_options_subtitle.tr(),
                style: textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              _Cell(
                title: LocaleKeys.habit_options_edit_title.tr(),
                description: LocaleKeys.habit_options_edit_subtitle.tr(),
                icon: Icons.edit_outlined,
                onTap: () => Navigator.pop(context, HabitOptions.edit),
              ),
              const Divider(),

              _Cell(
                title: LocaleKeys.habit_options_archive_title.tr(),
                description: LocaleKeys.habit_options_archive_subtitle.tr(),
                icon: Icons.archive_outlined,
                onTap: () => Navigator.pop(context, HabitOptions.archive),
              ),

              const Divider(),
              _Cell(
                title: LocaleKeys.habit_options_delete_title.tr(),
                description: LocaleKeys.habit_options_delete_subtitle.tr(),
                type: .destructive,
                icon: Icons.delete_outline,
                onTap: () => Navigator.pop(context, HabitOptions.delete),
              ),

              const SizedBox(height: AppPaddings.l),

              FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: colorScheme.surfaceAction,
                  foregroundColor: colorScheme.onSurface,
                ),
                onPressed: () => Navigator.pop(context),
                child: Text(LocaleKeys.habit_options_cancel.tr()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum _CellType { positive, destructive }

class _Cell extends StatelessWidget {
  const _Cell({
    required this.title,
    required this.description,
    required this.onTap,
    required this.icon,
    this.type = .positive,
  });

  final String title;
  final String description;
  final IconData icon;
  final VoidCallback onTap;
  final _CellType type;

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);
    final colorScheme = ColorScheme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppPaddings.l),
        child: Row(
          spacing: AppPaddings.m,
          children: [
            Container(
              height: 42,
              width: 42,
              decoration: AppDecoration.itemContainer(context).copyWith(
                color: type == .destructive ? colorScheme.errorContainer : null,
              ),
              child: Icon(
                icon,
                color: type == .destructive
                    ? colorScheme.onErrorContainer
                    : null,
              ),
            ),
            Column(
              crossAxisAlignment: .start,
              children: [
                Text(
                  title,
                  style: textTheme.titleMedium?.copyWith(
                    color: type == .destructive
                        ? colorScheme.onErrorContainer
                        : colorScheme.onSurface,
                  ),
                ),

                Text(
                  description,
                  style: textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
