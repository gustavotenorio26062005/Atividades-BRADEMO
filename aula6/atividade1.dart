import 'dart:async';

class UserError implements Exception {
  final String message;
  UserError(this.message);
  @override
  String toString() => message;
}

Future<String> fetchNewUsername() =>
    Future.delayed(const Duration(milliseconds: 500), 
    () => throw UserError('Inappropriate name'));

Future<String> changeUsername() async {
  try {
    return await fetchNewUsername();
  } catch (err) {
    return err.toString();
  }
}

Future<void> main() async {
  print('Testando changeUsername()...');
  
  final result = await changeUsername();
  
  if (result == 'Inappropriate name') {
    print('SUCESSO: Erro capturado e retornado como string.');
  } else {
    print('FALHA: O resultado retornado foi "$result"');
  }
}
