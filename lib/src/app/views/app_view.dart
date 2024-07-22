
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gtk_flutter/src/feature/auth/views/login/login_view.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(  
      locale: const Locale('pt', 'BR'),
      supportedLocales: [const Locale('pt', 'BR')],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: const ColorScheme.light().copyWith(primary: Colors.red)),
      home: const LoginView(),
    );
  
  }
}

/*
The name 'LoginView' is defined in the libraries 'package:firebase_ui_auth/src/views/login_view.dart (via package:firebase_ui_auth/firebase_ui_auth.dart)' and 'package:gtk_flutter/src/feature/auth/views/login_view.dart'.
Try using 'as prefix' for one of the import directives, or hiding the name from all but one of the imports.dartambiguous_import
Type: InvalidType
*/