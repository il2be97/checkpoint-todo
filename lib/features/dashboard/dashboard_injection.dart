import 'package:checkpoint/features/dashboard/presentation/blocs/dashboard_cubit.dart';
import 'package:get_it/get_it.dart';

Future<void> injectDashboard(GetIt sl) async {
  sl.registerFactory<DashboardCubit>(() => DashboardCubit());
}
