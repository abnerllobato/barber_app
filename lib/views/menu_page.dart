import 'package:barbearia_app/views/login_page/bloc/login_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../components/menu_button.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Barber Menu'),
          actions: [
            IconButton(
              icon: const Icon(Icons.exit_to_app),
              onPressed: () {
                context.read<LoginPageBloc>().add(SignOutButtonPressed());
              },
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
