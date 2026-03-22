class laptop{
  var id, nome, ram, clockCpu;
  
  laptop.navegacaoInternet(var id, var nome, var ram, clockCpu){
    this.id = id;
    this.nome = nome;
    this.ram = ram;
    this.clockCpu = clockCpu;
  }
  
  laptop.escritorio(var id, var nome, var ram, clockCpu){
    this.id = id;
    this.nome = nome;
    this.ram = ram;
    this.clockCpu = clockCpu;
  }
  
  laptop.programacao(var id, var nome, var ram, clockCpu){
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
  laptop chromeBook = laptop.navegacaoInternet(1, "chrome book", 8, 3);
  laptop dell = laptop.escritorio(2, "Dell", 8, 5);
  laptop lenovo = laptop.programacao(3, "Lenovo", 24, 7);
  print("Navegação internet:\n${chromeBook.info()}\n");
  print("Escritório:\n${dell.info()}\n");
  print("Programação:\n${lenovo.info()}\n");
}