void cadastrarFuncionario({required String nome, String ?cargo}){
  print("Funcionário $nome, Cargo: ${cargo ?? ""}");
  
}

void main() {
  cadastrarFuncionario(nome: "Luiz", cargo: "Gerente");
  cadastrarFuncionario(nome: "Fulano");
}
