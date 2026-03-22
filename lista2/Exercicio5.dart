import 'package:flutter/material.dart';

class Exercicio5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Cor principal usada nos ícones e textos dos botões (azul padrão do tema)
    Color color = Theme.of(context).primaryColor;

    // 1. Secção do Título
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'Oeschinen Lake Campground',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Kandersteg, Switzerland',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          const Text('41'),
        ],
      ),
    );

    // 2. Secção de Texto (Descrição)
    Widget textSection = const Padding(
      padding: EdgeInsets.all(32),
      child: Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
        'Alps. Situated 1,578 meters above sea level, it is one of the '
        'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
        'half-hour walk through pastures and pine forest, leads you to the '
        'lake, which warms to 20 degrees Celsius in the summer. Activities '
        'enjoyed here include rowing, and riding the summer toboggan run.',
        softWrap: true, // Garante que o texto quebra a linha quando chega ao limite do ecrã
      ),
    );

    // 3. Estrutura Principal da Tela
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter layout demo'),
      ),
      // Utiliza-se ListView em vez de Column para que a tela possa fazer scroll
      body: ListView(
        children: [
          Image.network(
            'https://raw.githubusercontent.com/flutter/website/main/src/assets/images/docs/ui/layout/lake.jpg',
            width: 600,
            height: 240,
            fit: BoxFit.cover, // Faz a imagem preencher o espaço mantendo a proporção
          ),
          titleSection,
          // Secção dos Botões (reaproveitando a lógica do Exercício 2)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButtonColumn(color, Icons.call, 'CALL'),
              _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
              _buildButtonColumn(color, Icons.share, 'SHARE'),
            ],
          ),
          textSection,
        ],
      ),
    );
  }

  // Método auxiliar para construir cada coluna de botão (Ícone + Texto)
  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}