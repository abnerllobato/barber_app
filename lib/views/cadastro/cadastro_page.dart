import 'package:barbearia_app/components/custom_text_field.dart';
import 'package:barbearia_app/views/cadastro/bloc/cadastro_bloc.dart';
import 'package:barbearia_app/views/menu_page.dart';
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
      appBar: AppBar(),
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
                      child: Padding(
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
                      ),
                    );
                  });
            }
            if (state is CadastroSuccessState) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: ((context) => const MenuPage())),
                  (route) => false);
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
              return const Center(
                child: Text('Sucesso Ao Cadastrar'),
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
                          context.read<CadastroBloc>().add(CadastroButtonEvent(
                                name: _controllerName.text,
                                email: _controllerEmail.text,
                                password: _controllerPassword.text,
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
