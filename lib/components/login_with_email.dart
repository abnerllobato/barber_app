import 'package:barbearia_app/views/menu_page.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../views/login_page/bloc/login_page_bloc.dart';
import 'custom_text_field.dart';

class LoginWithEmail extends StatelessWidget {
  LoginWithEmail({super.key});

  // controllers
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  // globalKey
  final formKey = GlobalKey<FormState>();

  final formValid = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Entrar Com E-mail'),
      ),
      body: BlocConsumer<LoginPageBloc, LoginPageState>(
        listener: (context, state) {
          if (state.status == LoginStatus.errorState) {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text(state.errorMessage!),
                  );
                });
          }
          if (state.status == LoginStatus.authenticated) {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: ((context) => const MenuPage())),
                (route) => false);
          }
        },
        builder: (context, state) {
          return Form(
            key: formKey,
            onChanged: () {
              formValid.value = formKey.currentState?.validate() ?? false;
            },
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 30, 0, 10),
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Color.fromRGBO(242, 201, 76, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),
                const Divider(),
                CustomTextField(
                  validator: (String? value) {
                    value = _controllerEmail.text;
                    if (value.isEmpty) {
                      return 'Email Obrigatorio';
                    }
                    if (EmailValidator.validate(value) == false) {
                      return 'Insira um e-mail valido';
                    }
                  },
                  controller: _controllerEmail,
                  labelText: 'Email',
                ),
                CustomTextField(
                  validator: (String? value) {
                    value = _controllerPassword.text;
                    if (value.isEmpty) {
                      return 'Senha obrigatoria';
                    } else if (value.length < 6) {
                      return 'Senha incorreta';
                    }
                  },
                  controller: _controllerPassword,
                  labelText: 'Senha',
                  obscureText: true,
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: ValueListenableBuilder<bool>(
                          valueListenable: formValid,
                          builder: (_, formValid, child) {
                            return CupertinoButton(
                              onPressed: !formValid
                                  ? null
                                  : () {
                                      formKey.currentState?.validate();
                                      context.read<LoginPageBloc>().add(
                                            LoginButtonPressed(
                                                email: _controllerEmail.text,
                                                password:
                                                    _controllerPassword.text),
                                          );
                                    },
                              color: Colors.amber,
                              child: const Text(
                                'Entrar',
                                style: TextStyle(),
                              ),
                            );
                          }),
                    )),
              ],
            ),
          );
        },
      ),
    );
  }
}
