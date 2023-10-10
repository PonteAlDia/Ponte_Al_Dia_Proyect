import 'package:flutter/material.dart';
import 'package:ponte_al_dia/src/provider/login/auth_provider.dart';

class LoginController {
  BuildContext? context;

  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  AuthProvider? authProvider;

  Future init(BuildContext context) async {
    this.context = context;
    authProvider = AuthProvider();
  }

  void login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    print('email: $email');
    print('password: $password');

    try {
      bool? isLogin = await authProvider?.login(email, password);
      if (isLogin != null) {
        print('El usuario esta logueado');
      } else {
        print('El usuario no se pudo autenticar');
      }
    } catch (error) {
      print('Error: $error');
    }
  }
}
