import 'package:checkpoint/core/services/app_resetter_sevice.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:checkpoint/core/navigation/app_router.dart';
import 'package:checkpoint/core/theme/app_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:material_ui/material_ui.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      key: ref.watch(appResetterServiceProvider),
      routerConfig: ref.watch(goRouterProvider),
      theme: AppTheme.dark,
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      darkTheme: AppTheme.dark,
      themeMode: .dark,
    );
  }
}
