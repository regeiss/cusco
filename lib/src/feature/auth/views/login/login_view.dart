import 'package:flutter/material.dart';
import 'package:gtk_flutter/src/feature/auth/views/login/components/button_section.dart';
import 'package:gtk_flutter/src/feature/auth/views/login/components/divider_section.dart';
import 'package:gtk_flutter/src/feature/auth/views/login/components/email_button.dart';
import 'package:gtk_flutter/src/feature/auth/views/login/components/image_section.dart';
import 'package:gtk_flutter/src/feature/auth/views/login/components/login_section.dart';
import 'package:gtk_flutter/src/feature/auth/views/login/components/title_section.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../providers/authentication_provider.dart';

class LoginView extends HookConsumerWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final email = useTextEditingController();
    final senha = useTextEditingController();

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
          ImageSection(image: 'assets/adocao.png'),
          const SizedBox(height: 20),
          TitleSection(titulo: 'Bem vindo ao ', subtitulo: 'Aplicativo Cusco - PMNH'),
          const SizedBox(height: 10),
          LoginEmailButton(),
          const SizedBox(height: 10),          
          DividerSection(),
          const SizedBox(height: 15),
          ButtonSection(),
          const SizedBox(height: 15),
          LoginSection()],
        ),
        )
    );
  }
}
