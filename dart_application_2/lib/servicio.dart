import 'dart:collection';
import 'dart:convert';

import 'package:dart_application_2/prueba.dart';
import 'package:http/retry.dart';
import 'package:http/http.dart' as http;

class Servicio{
  late RetryClient cliente;

  Servicio(){
    setConnection();
  }

  setConnection(){
    cliente = RetryClient(http.Client());
  }

  RetryClient getConnection(){
    return this.cliente;
  }

  Future<Map<String, dynamic>> getCode() async{
    Prueba prueba = Prueba(asignatura: "Matemáticas", numeroModulo: 3, cantidadPapeles: 10);
    Map<String, dynamic> returned = HashMap();
    try{
      final response = await getConnection().get(Uri.parse("https://world.openfoodfacts.org/api/v2/product/8480000107480"));

      if(response.statusCode == 200){
        Map<String, dynamic> deserializeResponse = jsonDecode(response.body);
        prueba.opiniones = deserializeResponse["code"];
        returned.addAll({"code" : 200, "Prueba" : prueba});
        return returned;
      }else{
        throw Exception("Algo ha ido mal con la solicitud...");
      }
    }catch (e){
      returned.addAll({"code" : 404, "MessageError" : "¡Error en la solicitud!: $e"});
      return returned;
    }
  }



}