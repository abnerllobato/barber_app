import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//mport 'package:flutter_signin_button/flutter_signin_button.dart';

import '../../components/login_with_email.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8, 350, 8, 25),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Barber's App",
                style: TextStyle(
                  color: Color.fromRGBO(242, 201, 76, 1),
                  fontWeight: FontWeight.bold,
                  fontSize: 45,
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: CupertinoButton(
                      color: Colors.amber,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => LoginWithEmail())));
                      },
                      child: const Text('Entrar com e-mail e senha'),
                    ),
                  ),
                  //    Botão Comentado (Sem Uso)
                  /* const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: SignInButton(
                      Buttons.GoogleDark,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MenuPage()));
                      },
                    ),
                  ), */
                ],
              ),
            ]),
      ),
    );
  }
}
