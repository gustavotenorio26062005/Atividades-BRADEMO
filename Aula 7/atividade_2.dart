import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Contador(),
      child: const EscopoPrimarioAppLogico(),
    ),
  );
}

class Contador extends ChangeNotifier {
  int _valorComputado = 0;

  int get valor => _valorComputado;

  void executarRotinaIncrementoTotal() {
    _valorComputado++;
    notifyListeners();
  }

  void executarRotinaDecrementoTotal() {
    _valorComputado--;
    notifyListeners();
  }
}

class EscopoPrimarioAppLogico extends StatelessWidget {
  const EscopoPrimarioAppLogico({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Atividade 2 - Provider',
      home: MalhaExibicaoReativaTotal(),
    );
  }
}

class MalhaExibicaoReativaTotal extends StatelessWidget {
  const MalhaExibicaoReativaTotal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contador com Provider')),
      body: Center(
        child: Consumer<Contador>(
          builder: (context, contador, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
