/*
  

  roberto 25/07/2024  
*/
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gtk_flutter/src/core/router/views/not_found_page.dart';

class Routes {

  static const home = '/';
  static const loginEmail = '/login_email';
  static const loginGoogle = '/login_google';
  static const homeNamedPage = '/home';
  static const onboardingPage = '/onboarding';
  static const profileNamedPage = '/profile';
  static const profileDetailsNamedPage = 'details';
  static const settingsNamedPage = '/settings';
  // static profileNamedPage([String? name]) => '/${name ?? ':profile'}';
  static Widget errorWidget(BuildContext context, GoRouterState state) => const NotFoundScreen();

}