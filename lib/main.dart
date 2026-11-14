import 'package:checkpoint/app.dart';
import 'package:checkpoint/core/bootstrap.dart';
import 'package:checkpoint/generated/codegen_loader.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await bootstrap();

  runApp(
    ProviderScope(
      child: EasyLocalization(
        supportedLocales: const [Locale('en')],
        path: 'assets/translations',
        assetLoader: const CodegenLoader(),
        fallbackLocale: const Locale('en'),
        child: const App(),
      ),
    ),
  );
}
