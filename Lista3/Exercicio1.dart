import 'package:flutter/material.dart';

void main() {
  runApp(const MeuAppAzul());
}

class MeuAppAzul extends StatelessWidget {
  const MeuAppAzul({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Definindo o ThemeData com a cor de fundo azul
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.blue, 
      ),
      home: const Scaffold(
        body: Center(
          child: Text(
            'Fundo Azul pelo ThemeData Original',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}