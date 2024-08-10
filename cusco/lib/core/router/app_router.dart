import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gtk_flutter/core/router/app_startup.dart';
import 'package:gtk_flutter/core/router/go_router_refresh_stream.dart';
import 'package:gtk_flutter/core/router/views/not_found_page.dart';
import 'package:gtk_flutter/src/feature/auth/data/firebase_auth_repository.dart';
import 'package:gtk_flutter/src/feature/home/view/home_view_bottom_bar.dart';
import 'package:gtk_flutter/src/feature/login/views/login_view.dart';
import 'package:gtk_flutter/src/feature/login/widgets/signup_view.dart';
import 'package:gtk_flutter/src/feature/onboarding/data/onboarding_repository.dart';
import 'package:gtk_flutter/src/feature/onboarding/views/onboarding_screen.dart';
import 'package:gtk_flutter/src/feature/profile/view/profile_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../src/feature/onboarding/provider/onboarding_provider.dart';

part 'app_router.g.dart';

// private navigators
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _jobsNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'jobs');
final _entriesNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'entries');
final _accountNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'account');
final GlobalKey<NavigatorState> sectionANavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'sectionANav');

enum AppRoute {
  onboarding,
  signIn,
  jobs,
  job,
  addJob,
  editJob,
  entry,
  addEntry,
  editEntry,
  entries,
  profile,
}

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  // rebuild GoRouter when app startup state changes
  final appStartupState = ref.watch(appStartupProvider);
  final authRepository = ref.watch(authRepositoryProvider);
  return GoRouter(
    initialLocation: '/login',
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    redirect: (context, state) {
      // If the app is still initializing, show the /startup route
      if (appStartupState.isLoading || appStartupState.hasError) {
        return '/onboarding';
      }
      final onboardingRepository =
          ref.read(onboardingRepositoryProvider).requireValue;
      final didCompleteOnboarding = onboardingRepository.isOnboardingComplete();
      final path = state.uri.path;
      if (!didCompleteOnboarding) {
        // Always check state.subloc before returning a non-null route
        // https://github.com/flutter/packages/blob/main/packages/go_router/example/lib/redirection.dart#L78
        if (path != '/onboarding') {
          return '/onboarding';
        }
        return null;
      }
      final isLoggedIn = authRepository.currentUser != null;
      if (isLoggedIn) {
        if (path.startsWith('/startup') ||
            path.startsWith('/onboarding') ||
            path.startsWith('/signIn')) {
          return '/login';
        }
      } else {
        if (path.startsWith('/startup') ||
            path.startsWith('/onboarding') ||
            path.startsWith('/jobs') ||
            path.startsWith('/entries') ||
            path.startsWith('/account')) {
          return '/signIn';
        }
      }
      return null;
    },
    refreshListenable: GoRouterRefreshStream(authRepository.authStateChanges()),

// class AppRouter {
//   static GoRouter createRouter(WidgetRef ref) {
//     final isOnboardingCompleted = ref.watch(onboardingNotifierProvider);
//     final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
//     final GlobalKey<NavigatorState> sectionANavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'sectionANav');

//     return GoRouter(
//       initialLocation: isOnboardingCompleted ? '/login' : '/onboarding',
//       navigatorKey: rootNavigatorKey,
      routes: <RouteBase>[
        GoRoute(
          name: 'login',
          path: '/login',
          builder: (context, state) => LoginView(),
        ),
        GoRoute(
          name: 'loginEmail',
          path: '/login_email',
          builder: (context, state) => SignupView(),
        ),
        GoRoute(
          name: 'onboarding',
          path: '/onboarding',
          builder: (context, state) => OnboardingScreen(),
        ),
        StatefulShellRoute.indexedStack(
          builder: (BuildContext context, GoRouterState state, StatefulNavigationShell navigationShell) {
            return HomeViewBottomBar(navigationShell: navigationShell);
          },
          branches: <StatefulShellBranch>[
            // The route branch for the first tab of the bottom navigation bar.
            StatefulShellBranch(
              navigatorKey: sectionANavigatorKey,
              routes: <RouteBase>[
                GoRoute(
                  path: '/home',
                  builder: (BuildContext context, GoRouterState state) => const RootScreen(label: 'A', detailsPath: '/a/details'),
                  routes: <RouteBase>[
                    GoRoute(
                      path: 'details',
                      builder: (BuildContext context, GoRouterState state) => const DetailsScreen(label: 'A'),
                    ),
                  ],
                ),
              ],
            ),

            StatefulShellBranch(
              routes: <RouteBase>[
                GoRoute(
                  path: '/b',
                  builder: (BuildContext context, GoRouterState state) => const RootScreen(
                    label: 'B',
                    detailsPath: '/b/details/1',
                    secondDetailsPath: '/b/details/2',
                  ),
                  routes: <RouteBase>[
                    GoRoute(
                      path: 'details/:param',
                      builder: (BuildContext context, GoRouterState state) => DetailsScreen(
                        label: 'B',
                        param: state.pathParameters['param'],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            StatefulShellBranch(
              routes: <RouteBase>[
                GoRoute(
                  path: '/c',
                  builder: (BuildContext context, GoRouterState state) => const RootScreen(
                    label: 'C',
                    detailsPath: '/c/details',
                  ),
                  routes: <RouteBase>[
                    GoRoute(
                      path: 'details',
                      builder: (BuildContext context, GoRouterState state) => DetailsScreen(
                        label: 'C',
                        extra: state.extra,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            StatefulShellBranch(
              routes: <RouteBase>[
                GoRoute(
                  path: '/d',
                  builder: (BuildContext context, GoRouterState state) => const RootScreen(
                    label: 'D',
                    detailsPath: '/c/details',
                  ),
                  routes: <RouteBase>[
                    GoRoute(
                      path: 'details',
                      builder: (BuildContext context, GoRouterState state) => DetailsScreen(
                        label: 'D',
                        extra: state.extra,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            StatefulShellBranch(
              routes: <RouteBase>[
                GoRoute(
                  path: '/profile',
                  builder: (BuildContext context, GoRouterState state) => const ProfileView(
                      // label: 'Perfil',
                      // detailsPath: '/e/details',
                      ),
                  // routes: <RouteBase>[
                  //   GoRoute(
                  //     path: 'profile',
                  //     builder: (BuildContext context, GoRouterState state) => ProfileView(),
                  //     //   label: 'E',
                  //     //   extra: state.extra,
                  //     // ),
                  //   ),
                  // ],
                ),
              ],
            ),
          ],
        ),
      ],
      errorBuilder: (context, state) => NotFoundScreen(),
    );
  }

