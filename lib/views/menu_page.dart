import 'package:flutter/material.dart';

import '../components/menu_button.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: MenuPage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Barber Menu'),
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
