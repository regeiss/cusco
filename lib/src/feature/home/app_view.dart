import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gtk_flutter/src/theme/theme_data.dart';
import '../../core/router/router.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp.router(
      routerConfig: AppRouter.router,
      locale: const Locale('pt', 'BR'),
      supportedLocales: [const Locale('pt', 'BR')],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,  
      theme: GlobalThemData.lightThemeData,
      darkTheme: GlobalThemData.darkThemeData,
    );
  }
}