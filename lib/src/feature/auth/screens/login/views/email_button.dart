import 'package:flutter/material.dart';

class LoginEmailButton extends StatelessWidget {
  const LoginEmailButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: 
      ElevatedButton(
        style: ElevatedButton.styleFrom(
            // foregroundColor: Colors.white,
            // backgroundColor: Colors.blue,
            elevation: 0,
            visualDensity: VisualDensity(
              horizontal: VisualDensity.maximumDensity,
              vertical: VisualDensity.maximumDensity,
            ),
          ),
        onPressed: () { },
        child: Text('Entrar com seu e-mail'),
      ),
    );
  }
}