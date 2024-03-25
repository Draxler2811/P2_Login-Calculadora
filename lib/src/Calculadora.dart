import 'package:flutter/material.dart';

class MyCalculadora extends StatefulWidget {
  @override
  _MyCalculadoraState createState() => _MyCalculadoraState();
}

class _MyCalculadoraState extends State<MyCalculadora> {
  String resultado = "";

  TextEditingController number1Controller = TextEditingController();
  TextEditingController number2Controller = TextEditingController();

  void onPressButtonSum() {
    setState(() {
      double number1 = double.tryParse(number1Controller.text) ?? 0.0;
      double number2 = double.tryParse(number2Controller.text) ?? 0.0;

      double result = number1 + number2;

      resultado = result.toString();
    });
     number1Controller.clear();
    number2Controller.clear();
  }

  void onPressButtonRes() {
    setState(() {
      double number1 = double.tryParse(number1Controller.text) ?? 0.0;
      double number2 = double.tryParse(number2Controller.text) ?? 0.0;

      double result = number1 - number2;

      resultado = result.toString();
    });
     number1Controller.clear();
    number2Controller.clear();
  }

  void onPressButtonMulti() {
    setState(() {
      double number1 = double.tryParse(number1Controller.text) ?? 0.0;
      double number2 = double.tryParse(number2Controller.text) ?? 0.0;

      double result = number1 * number2;

      resultado = result.toString();
    });
     number1Controller.clear();
    number2Controller.clear();
  }

  void onPressButtonDivi() {
    setState(() {
      double number1 = double.tryParse(number1Controller.text) ?? 0.0;
      double number2 = double.tryParse(number2Controller.text) ?? 0.0;

      double result = number1 / number2;

      resultado = result.toString();
    });
     number1Controller.clear();
    number2Controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ProCalculator"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        color: Colors.grey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Bienvenido a mi aplicación ProCalculator Omar Lozano",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.all(10.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: number1Controller,
                      keyboardType: TextInputType.number,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        labelText: "Número 1",
                        labelStyle: TextStyle(color: Colors.black),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: number2Controller,
                      keyboardType: TextInputType.number,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        labelText: "Número 2",
                        labelStyle: TextStyle(color: Colors.black),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
               SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: ElevatedButton(
                      child: Text(
                        "Sumar",
                        style: TextStyle(color: Colors.black),
                      ),
                      style: ElevatedButton.styleFrom(primary: Colors.blueAccent),
                      onPressed: () {
                        onPressButtonSum();
                      },
                    ),
                  ),
                  SizedBox(width: 40), 
                  Expanded(
                    child: ElevatedButton(
                      child: Text(
                        "Restar",
                        style: TextStyle(color: Colors.black),
                      ),
                      style: ElevatedButton.styleFrom(primary: Colors.blueAccent),
                      onPressed: () {
                        onPressButtonRes();
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40), 
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: ElevatedButton(
                      child: Text(
                        "Multiplicar",
                        style: TextStyle(color: Colors.black),
                      ),
                      style: ElevatedButton.styleFrom(primary: Colors.blueAccent),
                      onPressed: () {
                        onPressButtonMulti();
                      },
                    ),
                  ),
                  SizedBox(width: 40), 
                  Expanded(
                    child: ElevatedButton(
                      child: Text(
                        "Dividir",
                        style: TextStyle(color: Colors.black),
                      ),
                      style: ElevatedButton.styleFrom(primary: Colors.blueAccent),
                      onPressed: () {
                        onPressButtonDivi();
                      },
                    ),
                  ),
                ],
              ),
              Text(
                "Resultado",
                style: TextStyle(fontSize: 40.0),
              ),
              Text(
                resultado,
                style: TextStyle(fontSize: 40.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
