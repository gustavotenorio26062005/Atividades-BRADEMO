// atividade1.dart

// Função simulada fornecida pelo codelab
Future<String> fetchRole() => Future.delayed(
      const Duration(seconds: 2),
      () => 'Administrador',
    );

// Resolução do exercício:
Future<String> reportUserRole() async {
  final role = await fetchRole();
  return 'User role: $role';
}

void main() async {
  print('Buscando papel do usuário...');
  final result = await reportUserRole();
  print(result);
}