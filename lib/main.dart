import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  String _infoText = 'Informe seus dados!';

  void _resetFields() {
    weightController.text = '';
    heightController.text = '';
    _infoText = 'Informe seus dados!';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Calculadora de IMC',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: Icon(
              Icons.refresh,
              color: Colors.white,
              size: 25,
            ),
            onPressed: () {
              setState(() {
                _resetFields();
              });
            },
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Icon(
              Icons.person_outline,
              size: 120,
              color: Colors.green,
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: weightController,
              decoration: InputDecoration(
                labelText: 'Peso (kg)',
                labelStyle: TextStyle(
                  color: Colors.green,
                  fontSize: 25,
                ),
              ),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.green,
                fontSize: 25,
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: heightController,
              decoration: InputDecoration(
                labelText: 'Altura (cm)',
                labelStyle: TextStyle(
                  color: Colors.green,
                  fontSize: 25,
                ),
              ),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.green,
                fontSize: 25,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: Container(
                height: 50,
                padding:
                    const EdgeInsets.symmetric(vertical: 2, horizontal: 20),
                child: ElevatedButton(
                  onPressed: () {
                    //calcular Imc
                    double weight = double.parse(weightController.text);
                    double height = double.parse(heightController.text) / 100;
                    double imc = weight / (height * height);
                    //pop up
                    _infoText =
                        'Seu IMC é: ${imc.toStringAsPrecision(4)}\n${imc < 18.6 ? 'Abaixo do peso' : imc < 24.9 ? 'Peso ideal' : imc < 29.9 ? 'Levemente acima do peso' : imc < 34.9 ? 'Obesidade Grau I' : imc < 39.9 ? 'Obesidade Grau II' : 'Obesidade Grau III'}';
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          titleTextStyle: TextStyle(
                            color: Colors.green,
                            fontSize: 25,
                          ),
                          title: Text('Resultado do IMC'),
                          content: Text(
                              'Seu IMC é: ${imc.toStringAsPrecision(4)} \n${imc < 18.6 ? 'Abaixo do peso' : imc < 24.9 ? 'Peso ideal' : imc < 29.9 ? 'Levemente acima do peso' : imc < 34.9 ? 'Obesidade Grau I' : imc < 39.9 ? 'Obesidade Grau II' : 'Obesidade Grau III'}'),
                          actions: [
                            TextButton(
                              child: Text('Ok'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: Text(
                    'Calcular',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
            ),
            Text(_infoText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 25,
                )),
          ],
        ),
      ),
    );
  }
}
