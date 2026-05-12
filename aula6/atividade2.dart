// atividade2.dart

// Função simulada fornecida pelo codelab que lança um erro
Future<String> fetchNewUsername() => Future.delayed(
      const Duration(seconds: 2),
      () => throw Exception('Nome de usuário não encontrado'),
    );

// Resolução do exercício com try-catch:
Future<String> reportLogins() async {
  try {
    final username = await fetchNewUsername();
    return username;
  } catch (e) {
    return e.toString();
  }
}

void main() async {
  print('Tentando buscar usuário...');
  final result = await reportLogins();
  print('Resultado capturado: $result');
}