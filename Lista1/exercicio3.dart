class laptop{
  var id, nome, ram, clockCpu;
  
  laptop(var id, var nome, var ram, clockCpu){
    this.id = id;
    this.nome = nome;
    this.ram = ram;
    this.clockCpu = clockCpu;
  }
  
  String info(){
    return "Id: $id\nNome: $nome\nRAM:$ram\nClock CPU: $clockCpu";
  }
}

void main(){
  laptop thinkpad = laptop(1, "Thinkpad", 16, 5);
  laptop acer = laptop(2, "Aspire", 8, 4);
  laptop dell = laptop(3, "Inspirion", 24, 4.5);
  print("${thinkpad.info()}\n");
  print("${dell.info()}\n");
  print("${acer.info()}\n");
}