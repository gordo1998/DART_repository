class Examen{
  late String asignatura;
  late int numeroModulo;

  Examen(this.asignatura, this.numeroModulo);

  String estudiarExamen(){
    return "hola";
  }

  setAsignatura(String asignatura){
    this.asignatura = asignatura;
  }

  String getAsignatura(){
    return this.asignatura;
  }

  setNumeroModulo(int numero){
    this.numeroModulo = numero;
  }

  int getNumeroModulo(){
    return this.numeroModulo;
  }
}