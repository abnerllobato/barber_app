import 'package:barbearia_app/components/custom_text_field.dart';
import 'package:flutter/material.dart';

class CadastroPage extends StatelessWidget {
  const CadastroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 100),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "CADASTRE-SE",
                style: TextStyle(
                  color: Color.fromRGBO(242, 201, 76, 1),
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const CustomTextField(
                initialValue: "Nome",
                labelText: "Nome",
              ),
              const CustomTextField(
                initialValue: "E-mail",
                labelText: "E-mail",
                keyboardtype: TextInputType.emailAddress,
              ),
              const CustomTextField(
                initialValue: 'Senha',
                labelText: "Senha",
                keyboardtype: TextInputType.visiblePassword,
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Cadastrar",
                  style: TextStyle(
                    color: Color.fromRGBO(242, 201, 76, 1),
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
