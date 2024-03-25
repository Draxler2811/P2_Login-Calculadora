import 'dart:async';
import 'package:flutter/material.dart';
import 'package:login/src/bloc/validators.dart';

class Bloc with Validators {
  final _emailController = StreamController<String>();
  final _passwordController = StreamController<String>();

  

  Stream<String> get email => _emailController.stream.transform(ValidaEmail);
  Stream<String> get password => _passwordController.stream.transform(ValidaPassword);

  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  dispose() {
    _emailController.close();
    _passwordController.close();
  }
}

var bloc = Bloc();
