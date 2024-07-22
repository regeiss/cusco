import 'package:flutter/material.dart';

class LoginSection extends StatelessWidget {
  const LoginSection({ super.key,});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Já tem uma conta? '),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Login'),
              ),
          ],
      )
    );
  }
}