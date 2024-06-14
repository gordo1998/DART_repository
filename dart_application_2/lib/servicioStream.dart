import 'dart:collection';
import 'dart:convert';

import 'package:dart_application_2/prueba.dart';
import 'package:dart_application_2/servicio.dart';

class ServicioStream extends Servicio{
  Stream<Map<String, dynamic>> getCodeStream(String url) async*{
    Prueba prueba = Prueba(asignatura: "Matemáticas", numeroModulo: 3, cantidadPapeles: 10);
    Map<String, dynamic> returned = HashMap();
    try{
      final response = await getConnection().get(Uri.parse(url));

      if(response.statusCode == 200){
        Map<String, dynamic> deserializeResponse = jsonDecode(response.body);
        prueba.opiniones = deserializeResponse["code"];
        returned.addAll({"code" : 200, "Prueba" : prueba});
        yield returned;
      }else{
        throw Exception("Algo ha ido mal con la solicitud...");
      }
    }catch (e){
      returned.addAll({"code" : 404, "MessageError" : "¡Error en la solicitud!: $e"});
      yield returned;
    }
  }
}