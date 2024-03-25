import 'package:flutter/material.dart';
import 'package:login/src/bloc/bloc.dart';
import 'package:login/src/Calculadora.dart';

class LoginScreen extends StatelessWidget {
  // Lista de usuarios y contraseñas
  final List<Map<String, String>> usuarios = [
    {'email': 'omar@gmail.com', 'password': 'omar1234'},
    {'email': 'pepe@gmail.com', 'password': 'pepe1234'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          emailField(),
          passwordField(),
          Container(
            margin: EdgeInsets.only(top: 25.0),
          ),
          submitButton(context)
        ],
      ),
    );
  }

  Widget emailField() {
    return StreamBuilder(
      stream: bloc.email,
      builder: (context, snapshot) {
        return TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: 'You@example.com',
            labelText: 'Email',
            errorText: snapshot.error != null ? snapshot.error.toString() : null,
          ),
          onChanged: bloc.changeEmail,
        );
      },
    );
  }

  Widget passwordField() {
    return StreamBuilder(
      stream: bloc.password,
      builder: (context, snapshot) {
        return TextField(
          decoration: InputDecoration(
            labelText: 'Contraseña',
            hintText: 'Contraseña',
            errorText: snapshot.error != null ? snapshot.error.toString() : null,
          ),
          onChanged: bloc.changePassword,
        );
      },
    );
  }

  Widget submitButton(BuildContext context) {
    return ElevatedButton(
      child: Text('Entrar'),
      onPressed: () {
        // Verificar si el correo electrónico y la contraseña coinciden con algún usuario
        bool usuarioValido = usuarios.any((usuario) =>
            usuario['email'] == bloc.currentEmail &&
            usuario['password'] == bloc.currentPassword);

        if (usuarioValido) {
          // Si coinciden, navega a la pantalla de la calculadora
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyCalculadora()),
          );
        } else {
          // Si no coinciden, muestra un mensaje de error
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Usuario o contraseña incorrectos'),
            ),
          );
        }
      },
    );
  }
}
