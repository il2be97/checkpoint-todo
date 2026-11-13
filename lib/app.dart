import 'package:checkpoint/core/navigation/app_router.dart';
import 'package:checkpoint/core/theme/app_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:material_ui/material_ui.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      theme: AppTheme.dark,
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      darkTheme: AppTheme.dark,
      themeMode: .dark,
    );
  }
}
