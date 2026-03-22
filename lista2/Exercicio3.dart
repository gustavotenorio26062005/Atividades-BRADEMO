import 'package:flutter/material.dart';

class Exercicio3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stack & Positioned Widget'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                width: 180,
                height: 180,
                color: Colors.green[400],
                padding: const EdgeInsets.all(8.0),
                child: const Text('Green', style: TextStyle(color: Colors.white, fontSize: 18)),
              ),
            ),
            Positioned(
              top: 40,
              left: 40,
              child: Container(
                width: 180,
                height: 180,
                color: Colors.red[400],
                padding: const EdgeInsets.all(8.0),
                child: const Text('Red', style: TextStyle(color: Colors.white, fontSize: 18)),
              ),
            ),
            Positioned(
              top: 80,
              left: 80,
              child: Container(
                width: 180,
                height: 180,
                color: Colors.purple[400],
                padding: const EdgeInsets.all(8.0),
                child: const Text('Purple', style: TextStyle(color: Colors.white, fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}