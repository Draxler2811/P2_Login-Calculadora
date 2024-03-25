import 'dart:async';
import 'package:login/src/bloc/validators.dart';
import 'package:flutter/material.dart';

class Bloc with Validators{


  final bloc = Bloc();
  final _emailControler = StreamController<String>();
  final _passwordController = StreamController<String>();

Stream <String> get email => _emailControler.stream.transform(ValidaEmail);
Stream <String> get password => _passwordController.stream.transform(ValidaPassword);

  Function(String) get changeEmail => _emailControler.sink.add;
 Function(String) get changePassword => _passwordController.sink.add;


dispose(){ 
_emailControler.close();
_passwordController.close();
}
}

final bloc = Bloc();
