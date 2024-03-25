import 'package:flutter/material.dart';
import 'package:login/src/bloc/bloc.dart';

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
        submitButton()
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

  Widget submitButton() {
    return ElevatedButton(
      child: Text('Entrar'),
      onPressed: () {},
    );
  }
}