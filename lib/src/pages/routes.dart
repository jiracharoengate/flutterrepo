import 'package:cmflutter0/src/pages/home/home_page.dart';
import 'package:cmflutter0/src/pages/login/login_page.dart';
import 'package:cmflutter0/src/pages/register/register_page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const home = 'home';
  static const login = 'login';
  static const register = 'register';

  static get all => <String, WidgetBuilder>{
        login: (context) => const LoginPage(),
        home: (context) => const HomePage(),
        register: (context) => const RegisterPage()
      };
}
