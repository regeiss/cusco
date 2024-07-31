import 'package:go_router/go_router.dart';
// import 'package:gtk_flutter/src/core/router/router.dart';
// import 'package:gtk_flutter/src/feature/auth/screens/login/views/google_login.dart';
import 'package:gtk_flutter/src/feature/home/home_screen.dart';
// import 'package:gtk_flutter/src/feature/auth/screens/login/views/signup_view.dart';
import 'package:gtk_flutter/src/feature/onboarding/screens/onboarding_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../feature/onboarding/providers/onboarding_provider.dart';

class AppRouter {
  static GoRouter createRouter(WidgetRef ref) {
    final isOnboardingCompleted = ref.watch(onboardingNotifierProvider);

    return GoRouter(
      initialLocation: isOnboardingCompleted ? '/home' : '/onboarding',
      routes: [
        GoRoute(
          path: '/onboarding',
          builder: (context, state) => OnboardingScreen(),
        ),
        GoRoute(
          path: '/home',
          builder: (context, state) => HomeScreen(),
        ),
      ],
    );
  }
}