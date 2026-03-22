import 'package:flutter/material.dart';

void main() {
  runApp(const MeuAppTema());
}

class MeuAppTema extends StatelessWidget {
  const MeuAppTema({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Tema padrão da aplicação em Azul
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.blue,
      ),
      home: const Scaffold(
        body: AreaAmarela(),
      ),
    );
  }
}

class AreaAmarela extends StatelessWidget {
  const AreaAmarela({super.key});

  @override
  Widget build(BuildContext context) {
    // Aqui usamos o Theme para sobrescrever o contexto atual
    return Theme(
      data: Theme.of(context).copyWith(
        scaffoldBackgroundColor: Colors.yellow,
      ),
      // O Scaffold filho vai respeitar o tema sobrescrito (Amarelo)
      child: const Scaffold(
        body: Center(
          child: Text(
            'Fundo Amarelo (Tema Sobrescrito)',
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
        ),
      ),
    );
  }
}