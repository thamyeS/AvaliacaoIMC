import 'package:flutter/material.dart';

class imc extends StatefulWidget {
  const imc({super.key});

  @override
  State<imc> createState() => _imcScreenState();
}

class _imcScreenState extends State<imc> {
  String peso = '';
  String altura = '';
  String resultadoIMC = '';

  void calcularIMC() {
    double? pesoDouble = double.tryParse(peso);
    double? alturaDouble = double.tryParse(altura);

    if (pesoDouble != null && alturaDouble != null && alturaDouble > 0) {
      double imc = pesoDouble / (alturaDouble * alturaDouble);
      String classificacao;

      if (imc < 18.5) {
        classificacao = 'Abaixo do peso';
      } else if (imc >= 18.5 && imc < 24.9) {
        classificacao = 'Peso normal';
      } else if (imc >= 25 && imc < 29.9) {
        classificacao = 'Sobrepeso';
      } else {
        classificacao = 'Obesidade';
      }

      setState(() {
        resultadoIMC = 'Seu IMC é ${imc.toStringAsFixed(2)}: $classificacao';
      });
    } else {
      setState(() {
        resultadoIMC = 'Peso ou altura inválidos!';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('IMC'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Peso',
              style: TextStyle(fontSize: 18, color: Colors.blueGrey),
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Digite seu peso',
              ),
              onChanged: (value) {
                setState(() {
                  peso = value;
                });
              },
              keyboardType: TextInputType.number,
            ),
            Text(
              'Altura',
              style: TextStyle(fontSize: 18, color: Colors.blueGrey),
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Digite sua altura',
              ),
              onChanged: (value) {
                setState(() {
                  altura = value;
                });
              },
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: () {
                calcularIMC();
              },
              child: Text('Avaliar'),
            ),
            SizedBox(height: 20),
            Text(
              resultadoIMC,
              style: TextStyle(fontSize: 18, color: Colors.blueGrey),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}