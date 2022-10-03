import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import 'menu_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 150, 0, 0),
        child: Column(children: [
          const Text(
            "Barber's App",
            style: TextStyle(
              color: Color.fromRGBO(242, 201, 76, 1),
              fontWeight: FontWeight.bold,
              fontSize: 45,
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 180),
            child: SignInButton(
              Buttons.GoogleDark,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Menu()));
              },
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 60),
            ),
          ),
        ]),
      ),
    );
  }
}
