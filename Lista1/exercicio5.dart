import 'dart:io';

class House{
  int id, price;
  String name;
  
  House(var id, var name, var price){
    this.id = id;
    this.name = name;
    this.price = price;
  }
  
}

void main(){
// criando os objetos na mão
	var id, name, price;
	id = int.parse(stdin.readLineSync()!);
	name = stdin.readLineSync()!;
	price = int.parse(stdin.readLineSync()!);
  House house1 = House(id, name, price);
  
  id = int.parse(stdin.readLineSync()!);
	name = stdin.readLineSync()!;
	price = int.parse(stdin.readLineSync()!);
  House house2 = House(id, name, price);
  
	id = int.parse(stdin.readLineSync()!);
	name = stdin.readLineSync()!;
	price = int.parse(stdin.readLineSync()!);
  House house3 = House(id, name, price);
  
  List<House> houses = [];
  houses.add(house1);
  houses.add(house2);
  houses.add(house3);
  
  house1
    .name = "${house1.name} (cadastrada)";
  house2
    .name = "${house2.name} (cadastrada)";
  house3
    .name = "${house3.name}(cadastrada)";
  
  for(var h in houses){
    print(h.name);
  }
  
  
  
  
  
}