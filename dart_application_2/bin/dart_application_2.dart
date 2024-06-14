import 'dart:async';
import 'dart:collection';
import 'dart:convert';

import 'package:dart_application_2/dart_application_2.dart' as dart_application_2;
import 'package:dart_application_2/prueba.dart';
import 'package:dart_application_2/servicio.dart';
import 'package:dart_application_2/servicioStream.dart';
import 'package:http/retry.dart';
import 'package:http/http.dart' as http;

Future<void> main(List<String> arguments) async{
  String url = "https://world.openfoodfacts.org/api/v2/product/8480000107480";
  late Prueba prueba;
  late Map<String, dynamic> productos;
  bool competada = false;

  //Servicio servicio = Servicio();
  ServicioStream stream = ServicioStream();
  final myBroadcastStream = StreamController<Map<String, dynamic>>.broadcast();
  myBroadcastStream.stream.listen((value){
    if(value["code"] == 200){
      prueba = value["Prueba"];
      print("Prueba 1");
      print(prueba.toString());
    }else{
      print(value["MessageError"]);
    }
    
  }); 

  myBroadcastStream.stream.listen((value){
    if(value["code"] == 200){
      prueba = value["Prueba"];
      print("Prueba 2");
      print(prueba.toString());
    }else{
      print(value["MessageError"]);
    }
    
  }); 
  myBroadcastStream.stream.listen((value){
    if(value["code"] == 200){
      prueba = value["Prueba"];
      print("Prueba 3");
      print(prueba.toString());
    }else{
      print(value["MessageError"]);
    }
    
  }); 
  stream.getCodeStream("https://world.openfoodfacts.org/api/v2/product/84800001074").listen((event){
    myBroadcastStream.add(event);
  });

  stream.getCodeStream("https://world.openfoodfacts.org/api/v2/product/8480000107480").listen((event){
    myBroadcastStream.add(event);
    myBroadcastStream.add(event);
  });

  

  


  
  /*
  servicio.getCode().then((valor) {
    competada = true;
    productos = valor;
    if (productos["code"] == 200){
    prueba = productos["Prueba"];
    print(prueba.toString());
    }else{
      print(productos["MessageError"]);
    }
  });

  while(!competada){
    print("hola");
    await Future.delayed(Duration(milliseconds: 500));
  }
  */
}

