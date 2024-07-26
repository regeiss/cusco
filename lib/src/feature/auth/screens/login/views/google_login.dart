import 'package:flutter/material.dart';
import 'package:gtk_flutter/src/feature/auth/screens/login/views/home_button.dart';

class GoogleLoginScreen extends StatelessWidget {
  const GoogleLoginScreen({Key? key}) : super(key: key);

 @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("login Google", 
            style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 1.0)),
          HomeButton(),
          ],
      )
    );
  }
}