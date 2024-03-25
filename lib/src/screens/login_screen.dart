import 'package:flutter/material.dart';
import 'package:login/src/bloc/bloc.dart';
import 'package:login/src/Calculadora.dart';
class LoginScreen extends StatelessWidget {
  //se crea una intancia de bloc
  // final bloc = Bloc();

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.all(20.0),
      child: Column(children: <Widget>[
        emailField(),
        passwordField(),
        Container(
          margin: EdgeInsets.only(top: 25.0),
        ),
        submitButton(context)
      ]),
    );
  }

//Se crearan los widgets que no estan definidos, que se van a utilizar dentro de un contenedor y dentro de un scaford
  Widget emailField() {
    return StreamBuilder(
      stream: bloc.email,
      builder: (context, snapshot) {
        return TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              hintText: 'You@example.com',
              labelText: 'Email',
              errorText:
                  snapshot.error != null ? snapshot.error.toString() : null
                  ),
          onChanged:  bloc.changeEmail,
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
              errorText:
                  snapshot.error != null ? snapshot.error.toString() : null),
          onChanged: bloc.changePassword,
        );
      },
    );
  }
Widget submitButton(BuildContext context) { // Recibe el contexto como parámetro
    return ElevatedButton(
      child: Text('Entrar'),
      onPressed: () {
        // Navega a la pantalla de la calculadora cuando se hace clic en el botón "Entrar"
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyCalculadora()),
        );
      },
    );
  }
  }