import 'package:barbearia_app/components/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import '../menu_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // controllers
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  // route
  static Page<void> page() => MaterialPage<void>(child: LoginPage());

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
          CustomTextField(
            controller: _controllerEmail,
            labelText: 'Email',
          ),
          CustomTextField(
            controller: _controllerPassword,
            labelText: 'Senha',
          ),
          const SizedBox(
            height: 10,
          ),
          TextButton(onPressed: () {}, child: const Text('Entrar')),
          const SizedBox(
            height: 10,
          ),
          SignInButton(
            Buttons.GoogleDark,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MenuPage()));
            },
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 60),
          ),
        ]),
      ),
    );
  }
}
