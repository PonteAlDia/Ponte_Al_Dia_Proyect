import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:ponte_al_dia/src/crontroller/login/login_controller.dart';
import 'package:ponte_al_dia/src/widgets/button_app.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //Controlador
  LoginController cont = LoginController();

  @override
  void initState() {
    //Se ejecuta al inicializar el page
    super.initState();
    //Se jecuta al finalizar la creacion del page
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      cont.init(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      key: cont.key,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Stack(
            children: [
              _fondoLogin(size),
              _colorFondo(size),
              _formulario(size, colors),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buttonLogin() {
    return ButtonApp(
      color: Colors.blue.shade400,
      colorTexto: Colors.white,
      texto: 'Iniciar Sesión',
      onPressed: cont.login,
    );
  }

  Widget _textFieldEmail() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: TextField(
        controller: cont.emailController,
        decoration: const InputDecoration(
          hintText: 'correo@gmail.com',
          labelText: 'Correo electronico',
          suffixIcon: Icon(
            Icons.mark_email_read_outlined,
            color: Colors.blueAccent,
          ),
        ),
      ),
    );
  }

  Widget _textFieldPassword() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: TextField(
        controller: cont.passwordController,
        obscureText: true,
        decoration: const InputDecoration(
          hintText: '123456789',
          labelText: 'Contraseña',
          suffixIcon: Icon(
            Icons.lock_open_outlined,
            color: Colors.blueAccent,
          ),
        ),
      ),
    );
  }

  Widget _colorFondo(size) {
    return Container(
      height: size.height * 0.7,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.topRight,
          colors: [
            Color.fromARGB(198, 68, 137, 255),
            Color.fromARGB(51, 215, 210, 210),
          ],
        ),
      ),
    );
  }

  Widget _formulario(size, colors) {
    return Column(
      children: [
        SizedBox(
          height: size.height * 0.5,
          width: size.width * 1,
          child: Center(
            child: SizedBox(
              height: size.height * 0.3,
              child: ClipRRect(
                child: Image.asset(
                  'assets/images/logo.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        Container(
          height: size.height * 0.4,
          margin: const EdgeInsets.only(left: 40, right: 40),
          child: Card(
            color: colors.surface,
            elevation: 9.0,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      'Login',
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.blueAccent,
                          fontFamily: AutofillHints.addressState,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  _textFieldEmail(),
                  _textFieldPassword(),
                  const SizedBox(
                    height: 10,
                  ),
                  _buttonLogin()
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _fondoLogin(size) {
    return Container(
      height: size.height * 0.7,
      width: size.width * 1,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
        child: Image.asset(
          'assets/images/FondoLogin.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
