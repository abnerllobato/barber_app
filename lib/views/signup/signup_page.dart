import 'package:barbearia_app/components/custom_text_field.dart';
import 'package:barbearia_app/views/signup/bloc/signup_bloc.dart';
import 'package:barbearia_app/views/menu_page.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  // globalKey
  final formKey = GlobalKey<FormState>();

  final FormValid = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider<SignupBloc>(
        create: (context) => SignupBloc(),
        child: BlocConsumer<SignupBloc, SignupState>(
          listener: (context, state) {
            if (state is SignupFailed) {
              showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(25.0),
                    ),
                  ),
                  backgroundColor: Colors.amberAccent, // <-- SEE HERE
                  builder: (context) {
                    return Container(
                      height: 200,
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              state.errorMessage,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            )
                          ]),
                    );
                  });
            }
            if (state is SignupSuccessState) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: ((context) => const MenuPage())),
                  (route) => false);
            }
          },
          builder: (context, state) {
            if (state is SignupLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.amber,
                ),
              );
            }
            return Scaffold(
              body: Padding(
                padding: const EdgeInsets.symmetric(vertical: 100),
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    onChanged: () {
                      FormValid.value =
                          formKey.currentState?.validate() ?? false;
                    },
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
                        CustomTextField(
                          validator: (String? value) {
                            value = _controllerName.text;
                            if (value.isEmpty) {
                              return 'Nome é Obrigatório';
                            }
                            if (value.length <= 6) {
                              return 'Insira o Nome Completo';
                            }
                          },
                          controller: _controllerName,
                          labelText: "Nome",
                        ),
                        CustomTextField(
                          validator: (String? value) {
                            value = _controllerEmail.text;
                            if (value.isEmpty) {
                              return 'E-mail Obrigatorio';
                            }
                            if (EmailValidator.validate(value) == false) {
                              return 'Insira um e-mail valido';
                            }
                          },
                          controller: _controllerEmail,
                          labelText: "E-mail",
                          keyboardtype: TextInputType.emailAddress,
                        ),
                        CustomTextField(
                          validator: (String? value) {
                            value = _controllerPassword.text;
                            if (value.isEmpty) {
                              return 'Senha Obrigatoria';
                            }
                            if (value.length < 6) {
                              return 'Senha Muito Fraca';
                            }
                          },
                          controller: _controllerPassword,
                          labelText: "Senha",
                          keyboardtype: TextInputType.visiblePassword,
                          obscureText: true,
                        ),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          width: MediaQuery.of(context).size.width,
                          child: ValueListenableBuilder<bool>(
                            valueListenable: FormValid,
                            builder: (_, formValid, child) {
                              return CupertinoButton(
                                onPressed: !formValid
                                    ? null
                                    : () {
                                        context
                                            .read<SignupBloc>()
                                            .add(SignupButtonEvent(
                                              name: _controllerName.text,
                                              email: _controllerEmail.text,
                                              password:
                                                  _controllerPassword.text,
                                            ));
                                      },
                                color: Colors.amber,
                                child: const Text(
                                  "Cadastrar",
                                  style: TextStyle(),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
