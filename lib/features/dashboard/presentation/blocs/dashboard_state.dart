import 'package:freezed_annotation/freezed_annotation.dart';
part 'dashboard_state.freezed.dart';

enum DashboardTab {
  home,
  habits,
  settings;

  static DashboardTab fromInt(int index) {
    return values.firstWhere(
      (page) => page.index == index,
      orElse: () => .home,
    );
  }
}

@freezed
sealed class DashboardState with _$DashboardState {
  const DashboardState._();

  const factory DashboardState.initial() = DashboardInitial;

  const factory DashboardState.loaded({required DashboardTab page}) =
      DashboardLoaded;
}

extension DashboardStateX on DashboardState {
  DashboardTab get unwrappedPage =>
      this is DashboardLoaded ? (this as DashboardLoaded).page : .home;
}
