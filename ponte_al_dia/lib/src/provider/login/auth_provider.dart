/*Todos los archivos provider son aquellos con los hacemos peticiones http*/

import 'package:firebase_auth/firebase_auth.dart';

class AuthProvider {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  //Constructor
  AuthProvider() {
    firebaseAuth = FirebaseAuth.instance;
  }

  //Metodo para login
  Future<bool> login(String email, String password) async {
    try {
      //Await es para que espere a que el proceso termine antes de continuar con el codigo
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      //Se retorna la autenticacion exitosa
      return true;
    } catch (error) {
      if (error is FirebaseAuthException) {
        print(error.code);
      } else {
        //Manejador de errores
        print('Error desconocido');
      }
      //Lanza excepcion en caso de error
      rethrow;
    }
  }
}
