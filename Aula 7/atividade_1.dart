import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('config_app_usuario');
  runApp(const MainAppEntryPoint());
}

class MainAppEntryPoint extends StatelessWidget {
  const MainAppEntryPoint({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Atividade 1 - Hive',
      home: PainelAlternanciaVisual(),
    );
  }
}

class PainelAlternanciaVisual extends StatefulWidget {
  const PainelAlternanciaVisual({super.key});

  @override
  State<PainelAlternanciaVisual> createState() => _PainelAlternanciaVisualState();
}

class _PainelAlternanciaVisualState extends State<PainelAlternanciaVisual> {
  late final Box _ponteiroCaixaHive;
  late bool _indicadorModoFocadoAcionado;

  @override
  void initState() {
    super.initState();
    _ponteiroCaixaHive = Hive.box('config_app_usuario');
    _indicadorModoFocadoAcionado = _ponteiroCaixaHive.get('estado_foco_ui', defaultValue: false);
  }

  void _executarTrocaContextualLivre() {
    setState(() {
      _indicadorModoFocadoAcionado =!_indicadorModoFocadoAcionado;
      _ponteiroCaixaHive.put('estado_foco_ui', _indicadorModoFocadoAcionado);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _indicadorModoFocadoAcionado? Colors.blue : Colors.green,
      body: Center(
        child: ElevatedButton(
          onPressed: _executarTrocaContextualLivre,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            elevation: 8.0,
          ),
          child: Text(
            _indicadorModoFocadoAcionado? "Modo Focado" : "Modo Relax",
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
