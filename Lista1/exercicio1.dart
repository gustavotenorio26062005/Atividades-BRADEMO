void main() {
var nomeEquipamento;
String local;
dynamic patrimonio;

nomeEquipamento = "Impressora";
local = "Sala de cinema";
patrimonio = 45625;

print(nomeEquipamento is String);
print (local is String);
print(patrimonio is num);

patrimonio = "12345-A";
print(patrimonio is String);
}
// A variável 'patrimonio' é do tipo dynamic, funcionando como um camaleão,
// pois pode mudar de tipo conforme o valor que é atribuído a ela.

// Já a variável 'local' não é dynamic.
// Ela foi declarada como String, então seu tipo é fixo
// e não pode mudar para outro tipo durante o programa.