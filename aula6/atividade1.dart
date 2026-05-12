import 'dart:async';

Future<String> fetchRole() =>
    Future.delayed(const Duration(milliseconds: 500), () => 'Administrator');

Future<int> fetchLoginAmount() => 
    Future.delayed(const Duration(milliseconds: 500), () => 57);

Future<String> reportUserRole() async {
  final role = await fetchRole();
  return 'User role: $role';
}

Future<String> reportLogins() async {
  final logins = await fetchLoginAmount();
  return 'Total number of logins: $logins';
}

// Função principal para teste da atividade
Future<void> main() async {
  print('Iniciando Testes da Atividade 1...');
  
  final roleResult = await reportUserRole();
  print(roleResult); // Saída esperada: User role: Administrator
  
  final loginResult = await reportLogins();
  print(loginResult); // Saída esperada: Total number of logins: 57
  
  print('Testes concluídos com sucesso.');
}
