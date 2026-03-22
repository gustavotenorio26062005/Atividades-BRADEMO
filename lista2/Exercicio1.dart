import 'package:flutter/material.dart';

class Exercicio1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter is Fun!'),
        backgroundColor: Colors.green, 
      ),
      body: Center( 
        child: Container(
          width: 150,
          height: 150,
          color: Colors.red, 
          alignment: Alignment.topLeft, 
          padding: const EdgeInsets.all(8.0),
          child: const Text(
            'Hi Mom 👋',
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
        ),
      ),
    );
  }
}