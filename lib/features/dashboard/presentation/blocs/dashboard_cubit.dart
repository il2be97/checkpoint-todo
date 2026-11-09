import 'package:bloc/bloc.dart';
import 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(const DashboardState.initial());

  void start() {
    emit(const .loaded(page: .home));
  }

  void changePage(DashboardTab page) {
    emit(.loaded(page: page));
  }
}
