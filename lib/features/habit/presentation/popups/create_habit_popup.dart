import 'package:checkpoint/core/theme/app_decoration.dart';
import 'package:checkpoint/core/theme/app_icons.dart';
import 'package:checkpoint/core/theme/app_paddings.dart';
import 'package:checkpoint/features/habit/domain/entities/quest.dart';
import 'package:checkpoint/features/habit/presentation/helpers/habit_colors_helper.dart';
import 'package:checkpoint/features/habit/presentation/helpers/habit_icons_helper.dart';
import 'package:checkpoint/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Future<Habit?> showCreateHabit(BuildContext context) async {
  return showModalBottomSheet(
    context: context,
    useRootNavigator: true,
    isScrollControlled: true,
    useSafeArea: true,
    builder: (context) => DraggableScrollableSheet(
      initialChildSize: 0.7,
      expand: false,
      minChildSize: 0.5,
      maxChildSize: 0.85,
      builder: (context, controller) => _Popup(controller),
    ),
  );
}

class _Popup extends StatefulWidget {
  final ScrollController scrollController;

  const _Popup(this.scrollController);

  @override
  State<_Popup> createState() => _PopupState();
}

class _PopupState extends State<_Popup> {
  HabitIcons _icon = .book;
  HabitColors _color = .lavender;
  TimeOfDay _time = TimeOfDay.now();
  String _title = '';

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);
    final colorScheme = ColorScheme.of(context);

    void setIcon(HabitIcons icon) => setState(() {
      _icon = icon;
    });

    void setColor(HabitColors color) => setState(() {
      _color = color;
    });

    void setTitle(String text) => setState(() {
      _title = text;
    });

    void setTime(TimeOfDay time) => setState(() => _time = time);

    void onSavePressed() {}

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => FocusScope.of(context).unfocus(),
      child: SingleChildScrollView(
        controller: widget.scrollController,
        padding: const .symmetric(vertical: AppPaddings.l),
        child: Column(
          spacing: AppPaddings.l,
          crossAxisAlignment: .start,
          children: [
            // Divider
            const Center(
              child: SizedBox(width: 40, child: Divider(thickness: 5)),
            ),

            // Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPaddings.l),
              child: Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: .start,
                    children: [
                      Text(
                        LocaleKeys.create_habit_title.tr(),
                        style: textTheme.headlineMedium?.copyWith(
                          color: colorScheme.onSurface,
                        ),
                      ),
                      Text(
                        LocaleKeys.create_habit_subtitle.tr(),
                        style: textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
            ),

            // Name
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPaddings.l),
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Text(
                    LocaleKeys.create_habit_placeholder_title.tr(),
                    style: textTheme.labelMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: AppPaddings.s),
                  TextField(
                    decoration: InputDecoration(
                      hintText: LocaleKeys.create_habit_placeholder.tr(),
                    ),
                    onChanged: setTitle,
                  ),
                ],
              ),
            ),

            // Icon
            Column(
              crossAxisAlignment: .start,
              children: [
                Padding(
                  padding: const .symmetric(horizontal: AppPaddings.l),
                  child: Text(
                    LocaleKeys.create_habit_icon_title.tr(),
                    style: textTheme.labelMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
                const SizedBox(height: AppPaddings.s),
                SingleChildScrollView(
                  scrollDirection: .horizontal,
                  padding: const .symmetric(horizontal: AppPaddings.l),
                  child: _IconButtons(
                    onChanged: setIcon,
                    selected: _icon,
                    activeColor: _color,
                  ),
                ),
              ],
            ),

            // Color
            Column(
              crossAxisAlignment: .start,
              children: [
                Padding(
                  padding: const .symmetric(horizontal: AppPaddings.l),
                  child: Text(
                    LocaleKeys.create_habit_icon_title.tr(),
                    style: textTheme.labelMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
                const SizedBox(height: AppPaddings.s),
                SingleChildScrollView(
                  scrollDirection: .horizontal,
                  padding: const .symmetric(horizontal: AppPaddings.l),
                  child: _ColorButtons(onChanged: setColor, selected: _color),
                ),
              ],
            ),

            // Notification Time
            Padding(
              padding: const .symmetric(horizontal: AppPaddings.l),
              child: Column(
                crossAxisAlignment: .stretch,
                children: [
                  Text(
                    LocaleKeys.create_habit_notifification_title.tr(),
                    style: textTheme.labelMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: AppPaddings.s),
                  _NotificationField(
                    color: _color,
                    time: _time,
                    onChanged: setTime,
                  ),
                  const SizedBox(height: AppPaddings.m),
                  Text(
                    LocaleKeys.create_habit_notification_hint.tr(),
                    style: textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),

            Row(
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(LocaleKeys.create_habit_cancel.tr()),
                ),

                TextButton(
                  onPressed: onSavePressed,
                  child: Text(LocaleKeys.create_habit_save.tr()),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// MARK: - Color Buttons
class _ColorButtons extends StatelessWidget {
  const _ColorButtons({required this.onChanged, required this.selected});

  final ValueSetter<HabitColors> onChanged;
  final HabitColors selected;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: AppPaddings.m,
      children: HabitColors.values
          .map(
            (color) => _ColorButton(
              onTap: () => onChanged(color),
              isSelected: selected == color,
              color: color,
            ),
          )
          .toList(),
    );
  }
}

class _ColorButton extends StatelessWidget {
  const _ColorButton({
    required this.onTap,
    required this.isSelected,
    required this.color,
  });

  final VoidCallback onTap;
  final bool isSelected;
  final HabitColors color;

  @override
  Widget build(BuildContext context) {
    final scheme = ColorScheme.of(context);
    return Ink(
      height: 48,
      width: 48,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: isSelected
            ? Border.all(color: color.foreground, width: 2)
            : null,
        color: isSelected ? color.background : scheme.surfaceContainer,
      ),
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: isSelected
            ? Icon(Icons.check, size: 20, color: color.foreground)
            : null,
      ),
    );
  }
}

// MARK: - Icon Buttons

class _IconButtons extends StatelessWidget {
  const _IconButtons({
    required this.onChanged,
    required this.selected,
    required this.activeColor,
  });

  final ValueSetter<HabitIcons> onChanged;
  final HabitIcons selected;
  final HabitColors activeColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: AppPaddings.m,
      children: HabitIcons.values
          .map(
            (icon) => _IconButton(
              onTap: () => onChanged(icon),
              isSelected: selected == icon,
              icon: icon,
              color: activeColor,
            ),
          )
          .toList(),
    );
  }
}

class _IconButton extends StatelessWidget {
  const _IconButton({
    required this.onTap,
    required this.isSelected,
    required this.icon,
    required this.color,
  });

  final VoidCallback onTap;
  final bool isSelected;
  final HabitIcons icon;
  final HabitColors color;

  @override
  Widget build(BuildContext context) {
    final scheme = ColorScheme.of(context);

    return Ink(
      height: 48,
      width: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: isSelected ? Border.all(color: color.foreground) : null,
        color: isSelected ? color.background : scheme.surfaceContainer,
      ),
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: SvgPicture.asset(
            icon.iconPath,
            colorFilter: ColorFilter.mode(
              isSelected ? color.foreground : scheme.onSurface,
              .srcIn,
            ),
          ),
        ),
      ),
    );
  }
}

// MARK: - Notification Field
class _NotificationField extends StatelessWidget {
  const _NotificationField({
    required this.color,
    required this.time,
    required this.onChanged,
  });

  final ValueSetter<TimeOfDay> onChanged;
  final HabitColors color;
  final TimeOfDay time;

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.of(context);
    final textTheme = TextTheme.of(context);
    return GestureDetector(
      onTap: () async {
        final newTime = await showTimePicker(
          context: context,
          initialTime: time,
        );
        if (newTime == null) return;
        onChanged(newTime);
      },
      child: Container(
        padding: const .all(AppPaddings.s),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: color.foreground),
        ),
        child: Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Row(
              children: [
                const Icon(Icons.alarm),
                const SizedBox(width: AppPaddings.s),
                Text(
                  LocaleKeys.create_habit_every_day.tr(),
                  style: textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "${time.hour}:${time.minute}",
                  style: textTheme.titleMedium?.copyWith(
                    color: colorScheme.onSurface,
                  ),
                ),
                Container(
                  padding: const .symmetric(
                    vertical: AppPaddings.xs,
                    horizontal: AppPaddings.s,
                  ),
                  decoration: AppDecoration.itemContainer(context),
                  child: Text(
                    time.period.name.toUpperCase(),
                    style: textTheme.labelSmall?.copyWith(
                      color: colorScheme.onSurface,
                    ),
                  ),
                ),
                SvgPicture.asset(AppIcons.unfold),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
