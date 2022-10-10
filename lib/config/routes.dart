import 'package:barbearia_app/views/login_page/bloc/login_page_bloc.dart';
import 'package:flutter/material.dart';

import '../views/login_page/login_page.dart';
import '../views/menu_page.dart';

List<Page<dynamic>> onGenerateAppViewPages(
  LoginStatus state,
  List<Page<dynamic>> pages,
) {
  switch (state) {
    case LoginStatus.authenticated:
      return [MenuPage.page()];
    case LoginStatus.unauthenticated:
      return [LoginPage.page()];
  }
}
