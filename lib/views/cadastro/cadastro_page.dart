import 'package:barbearia_app/components/custom_text_field.dart';
import 'package:barbearia_app/models/cadastro_model.dart';
import 'package:barbearia_app/views/cadastro/bloc/cadastro_bloc.dart';
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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<CadastroBloc>(
        create: (context) => CadastroBloc(),
        child: BlocConsumer<CadastroBloc, CadastroState>(
          listener: (context, state) {
            if (state is CadastroFailed) {
              showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(25.0),
                    ),
                  ),
                  backgroundColor: Colors.amberAccent, // <-- SEE HERE
                  builder: (context) {
                    return SizedBox(
                      height: 200,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "Ops Algo de Errado não esta certo !!!",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            )
                          ]),
                    );
                  });
            }
          },
          builder: (context, state) {
            if (state is CadastroLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.amber,
                ),
              );
            }
            if (state is CadastroSuccessState) {
              return Center(
                child: Column(
                  children: [
                    Text(state.name),
                    Text(state.email),
                    Text(state.password),
                  ],
                ),
              );
            }

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
                      CustomTextField(
                        controller: _controllerName,
                        labelText: "Nome",
                      ),
                      CustomTextField(
                        controller: _controllerEmail,
                        labelText: "E-mail",
                        keyboardtype: TextInputType.emailAddress,
                      ),
                      CustomTextField(
                        controller: _controllerPassword,
                        labelText: "Senha",
                        keyboardtype: TextInputType.visiblePassword,
                        obscureText: true,
                      ),
                      TextButton(
                        onPressed: () {
                          context
                              .read<CadastroBloc>()
                              .add(OnButtonPressedCadastroEvent(
                                Cadastro(
                                  email: _controllerEmail.text,
                                  name: _controllerName.text,
                                  password: _controllerPassword.text,
                                  dataCriacao: '',
                                  dataModificacao: '',
                                  nivel: 'adm',
                                ),
                              ));
                        },
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
          },
        ),
      ),
    );
  }
}
