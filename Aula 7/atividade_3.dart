import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox<List<String>>('repositorio_caixa_listagens_metadados');
  
  runApp(
    ChangeNotifierProvider(
      create: (_) => TarefaProvider(),
      child: const ControleTarefasAppTotal(),
    ),
  );
}

class TarefaProvider extends ChangeNotifier {
  late final Box<List<String>> _conectorCaixaLogicaFisica;
  final String _chaveIdentificacaoMestreBase = 'arquivamento_vetorial_chaves_tarefa';
  List<String> _matrizEstadoLogicoTarefas =;

  List<String> get tarefas => List.unmodifiable(_matrizEstadoLogicoTarefas);

  TarefaProvider() {
    _conectorCaixaLogicaFisica = Hive.box<List<String>>('repositorio_caixa_listagens_metadados');
    final extracaoDeDadosArmazenadosFrios = _conectorCaixaLogicaFisica.get(_chaveIdentificacaoMestreBase);
    
    if (extracaoDeDadosArmazenadosFrios!= null) {
      _matrizEstadoLogicoTarefas = List<String>.from(extracaoDeDadosArmazenadosFrios);
    }
  }

  void executarAdicaoDadosTarefasMestre(String conteudoTextoNovoSubmetido) {
    if (conteudoTextoNovoSubmetido.trim().isEmpty) return;
    
    _matrizEstadoLogicoTarefas.add(conteudoTextoNovoSubmetido);
    _engatilharSincronizacaoAssincronaPorMatriz();
    notifyListeners();
  }

  void eliminarVetorEspecificoRestrito(int indexador) {
    if (indexador >= 0 && indexador < _matrizEstadoLogicoTarefas.length) {
      _matrizEstadoLogicoTarefas.removeAt(indexador);
      _engatilharSincronizacaoAssincronaPorMatriz();
      notifyListeners();
    }
  }

  void _engatilharSincronizacaoAssincronaPorMatriz() {
    _conectorCaixaLogicaFisica.put(_chaveIdentificacaoMestreBase, _matrizEstadoLogicoTarefas);
  }
}

class ControleTarefasAppTotal extends StatelessWidget {
  const ControleTarefasAppTotal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Atividade 3 - TodoList',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const InterfaceControladorCentralTodoListaAppBase(),
    );
  }
}

class InterfaceControladorCentralTodoListaAppBase extends StatelessWidget {
  const InterfaceControladorCentralTodoListaAppBase({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controladorEntrada = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Lista de Tarefas (Hive + Provider)')),
      body: Column(
        children:,
            ),
          ),
          const Divider(),
          Expanded(
            child: Consumer<TarefaProvider>(
              builder: (context, provider, child) {
                if (provider.tarefas.isEmpty) {
                  return const Center(
                    child: Text('Nenhuma tarefa pendente.'),
                  );
                }
                
                return ListView.builder(
                  itemCount: provider.tarefas.length,
                  itemBuilder: (context, index) {
                    final tarefa = provider.tarefas[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: ListTile(
                        title: Text(tarefa, style: const TextStyle(fontWeight: FontWeight.w600)),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete_forever_rounded, color: Colors.deepOrange),
                          onPressed: () => provider.eliminarVetorEspecificoRestrito(index),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
