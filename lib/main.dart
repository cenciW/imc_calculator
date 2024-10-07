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
              setState(() {});
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
                  onPressed: () {},
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
            const Text('Info',
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
