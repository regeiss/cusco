import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gtk_flutter/firebase_options.dart';
import 'package:gtk_flutter/src/app/views/app_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: AppView()));

}
