import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ud_mobile_app/core/app/router/app_routes.dart';
import 'package:ud_mobile_app/injection/injection.dart';
import 'package:ud_mobile_app/l10n/l10n.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return MaterialApp.router(
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      routerConfig: getIt<AppRouter>().config(),
    );
  }
}
