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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Entrar Com E-mail'),
      ),
      body: Column(
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
          BlocBuilder<LoginPageBloc, LoginPageState>(
            builder: (context, state) {
              if (state.status == LoginStatus.errorState) {
                return Text(
                  state.errorMessage!,
                  style: const TextStyle(
                    color: Colors.red,
                  ),
                );
              } else {
                return Container();
              }
            },
          ),
          CustomTextField(
            onChanged: (val) {
              context.read<LoginPageBloc>().add(
                    SignInTextChangedEvent(
                        _controllerEmail.text, _controllerPassword.text),
                  );
            },
            controller: _controllerEmail,
            labelText: 'Email',
            obscureText: false,
          ),
          CustomTextField(
            onChanged: (val) {
              context.read<LoginPageBloc>().add(
                    SignInTextChangedEvent(
                        _controllerEmail.text, _controllerPassword.text),
                  );
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
            child: BlocBuilder<LoginPageBloc, LoginPageState>(
              builder: (context, state) {
                return CupertinoButton(
                  onPressed: (state.status == LoginStatus.validState)
                      ? () {
                          context.read<LoginPageBloc>().add(
                                LoginButtonPressed(
                                    email: _controllerEmail.text,
                                    password: _controllerPassword.text),
                              );
                        }
                      : null,
                  child: const Text('Entrar'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
