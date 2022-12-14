import 'package:barbearia_app/firebase_options.dart';
import 'package:barbearia_app/views/login_page/bloc/login_page_bloc.dart';
import 'package:barbearia_app/views/login_page/login_page.dart';
import 'package:barbearia_app/views/menu_page.dart';
import 'package:flutter/material.dart';

// firebase
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginPageBloc(),
      child: const MyAppView(),
    );
  }
}

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Barber App',
      theme: ThemeData.dark(),
      home: BlocConsumer<LoginPageBloc, LoginPageState>(
        builder: ((context, state) {
          if (state.status == LoginStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return LoginPage();
        }),
        listener: (context, state) {
          if (state.status == LoginStatus.authenticated) {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: ((context) => const MenuPage())),
                (route) => false);
          }
          if (state.status == LoginStatus.unauthenticated) {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: ((context) => LoginPage())),
                (route) => false);
          }
        },
      ),
    );
  }
}
