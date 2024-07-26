import 'package:go_router/go_router.dart';
import 'package:gtk_flutter/src/core/router/routes.dart';
import 'package:gtk_flutter/src/feature/auth/screens/login/views/google_login.dart';
import 'package:gtk_flutter/src/feature/home/home_view.dart';
import 'package:gtk_flutter/src/feature/auth/screens/login/views/signup_view.dart';
import 'package:gtk_flutter/src/feature/onboarding/screens/onboarding_screen.dart';

class AppRouter {

// final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
// final _sectionNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter _router = GoRouter(
    
    initialLocation: '/onboarding',
    routes: [

      GoRoute(
        name: 'onboarding',
        path: Routes.onboardingPage,
        builder: (context, state) => OnboardingScreen(),
      ),

      GoRoute(
        name: 'home', 
        path: Routes.home,
        builder: (context, state) => HomeView(),
      ),

      GoRoute(
        name: 'login_email',
        path: Routes.loginEmail,
        builder: (context, state) => SignupView(),
      ),

      GoRoute(
        name: 'login_google',
        path: Routes.loginGoogle,
        builder: (context, state) => GoogleLoginScreen(),
      ),
    ],

  //   redirect: (BuildContext context, GoRouterState state) {
  //     if (!AuthenticationState.authenticated(user: user) == _Authenticated)) {
  //       return '/signin';
  // }   else {
  //       return null;
  //     }   
    debugLogDiagnostics: true,
  );  

  static GoRouter get router => _router;

}