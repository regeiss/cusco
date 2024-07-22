import 'package:flutter/material.dart';
import 'package:flutter_social_button/flutter_social_button.dart';

class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         children: [
            Icon(
            FontAwesomeIcons.google,
            size: 50,
            color: Colors.red,
            ),
            Icon(
              FontAwesomeIcons.facebook,
              size: 50,
              color: Colors.blue,
            ),
            Icon(
              FontAwesomeIcons.whatsapp,
              size: 50,
              color: Colors.green,
            ),
            Icon(
              FontAwesomeIcons.apple,
              size: 50,
              color: Colors.black,
            ),
          ],
      )
    );
  }
}