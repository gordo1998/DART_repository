import 'package:dart_application_2/dificultad.dart';
import 'package:dart_application_2/examen.dart';

class Prueba extends Examen with Dificultad{
  late int cantidadPapeles;
  Prueba({
    required asignatura, 
    required numeroModulo, 
    required this.cantidadPapeles}
  ) : super(asignatura, numeroModulo);

  @override
  String estudiarExamen(){
    return "adios";
  }

  setCantidadPapeles(int papeles){
    this.cantidadPapeles = papeles;
  }

  int getCantidadPapeles(){
    return this.cantidadPapeles;
  }

  @override
  String toString() {
    return "${this.asignatura}, ${this.numeroModulo}, ${this.cantidadPapeles}, ${this.opiniones}";
    
  }
}