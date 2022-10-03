import 'package:flutter/material.dart';

import '../components/menu_button.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

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
