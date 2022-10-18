import 'package:barbearia_app/views/login_page/bloc/login_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../components/menu_button.dart';
import 'login_page/login_page.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Barber Menu'),
          actions: [
            BlocListener<LoginPageBloc, LoginPageState>(
              listener: (context, state) {
                if (state.status == LoginStatus.logoutState) {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const LoginPage())),
                      (route) => false);
                }
                if (state.status == LoginStatus.authenticated) {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const MenuPage())),
                      (route) => false);
                }
              },
              child: IconButton(
                icon: const Icon(Icons.exit_to_app),
                onPressed: () {
                  context.read<LoginPageBloc>().add(SignOutButtonPressed());
                },
              ),
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            MenuButton(title: 'Barbeiros', onPressed: () {}),
            MenuButton(title: 'Agendamentos', onPressed: () {}),
            MenuButton(title: 'Serviços', onPressed: () {}),
            MenuButton(title: 'Localização', onPressed: () {})
          ],
        ));
  }
}
