import 'package:flutter/material.dart';
import 'package:gtk_flutter/src/feature/auth/screens/login/views/button_section.dart';
import 'package:gtk_flutter/src/feature/auth/screens/login/views/divider_section.dart';
import 'package:gtk_flutter/src/feature/auth/screens/login/views/email_button.dart';
import 'package:gtk_flutter/src/feature/auth/screens/login/views/image_section.dart';
import 'package:gtk_flutter/src/feature/auth/screens/login/views/login_section.dart';
import 'package:gtk_flutter/src/feature/auth/screens/login/views/title_section.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../auth/providers/authentication_provider.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    // final email = useTextEditingController();
    // final senha = useTextEditingController();

    ref.listen(authNotifierProvider, (previous, next) {
      next.maybeWhen(
        orElse: () => null,
        authenticated: (user) {
          // Navigate to any screen
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Usuário logado'),
              behavior: SnackBarBehavior.floating,
            ),
          );
        },
        unauthenticated: (message) => ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message!), behavior: SnackBarBehavior.floating,),
        ),
      );
    });

    return Scaffold(
      body: Container(
        child: Column( children: [ 
          const SizedBox(height: 55),
          ImageSection(image: 'assets/adocao.jpg'),
          const SizedBox(height: 10),
          TitleSection(titulo: 'Bem vindo ao ', subtitulo: 'Aplicativo Cusco - PMNH'),
          const SizedBox(height: 10),
          LoginEmailButton(),
          const SizedBox(height: 10),          
          DividerSection(),
          const SizedBox(height: 10),
          ButtonSection(),
          const SizedBox(height: 10),
          LoginSection()],
        ),
      )
    );
  }
}
