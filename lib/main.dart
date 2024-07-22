import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gtk_flutter/firebase_options.dart';
import 'package:gtk_flutter/src/app/views/app_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: AppView()));
}

final _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      name: 'home', // Optional, add name to your routes. Allows you navigate by name instead of path
      path: '/',
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      name: 'shope',
      path: '/shope',
      builder: (context, state) => ShopeScreen(),
    ),
  ],
);