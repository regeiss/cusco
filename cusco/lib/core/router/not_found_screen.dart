import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text("Pagina não encontrada"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.go("/login"),
          child: const Text("Voltar à pagina inicial"),
        ),
      ),
    );
  }
}
