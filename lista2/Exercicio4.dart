import 'package:flutter/material.dart';

class Exercicio4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Insert Image Example'),
        backgroundColor: Colors.lightBlue,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20), // Pequeno espaço no topo
            Container(
              width: 350,
              height: 200,
              color: Colors.grey[200], // Fundo caso a imagem demore a carregar
              child: FittedBox(
                fit: BoxFit.cover,
                // Pode usar qualquer imagem da internet (NetworkImage) ou local (AssetImage)
                child: Image.network('https://picsum.photos/500/300'), 
              ),
            ),
            const SizedBox(height: 40), // Widget responsável pela separação das imagens
            Container(
              width: 350,
              height: 300,
              color: Colors.grey[200],
              child: FittedBox(
                fit: BoxFit.cover,
                child: Image.network('https://picsum.photos/500/400'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}