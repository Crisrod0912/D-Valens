// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<String> createCategoria(String nombre, String randomDocGen) async {
  String mensaje = "Categoría creada";
  DateTime created_time = DateTime.now();

  FirebaseApp app = await Firebase.initializeApp(
      name: randomDocGen, options: Firebase.app().options);

  try {
    final CollectionReference<Map<String, dynamic>> Categorias =
        FirebaseFirestore.instance.collection('Categorias');

    DocumentReference docRef = await Categorias.add(<String, dynamic>{
      'nombre': nombre,
      'created_time': created_time,
    });

    if (docRef.id.isNotEmpty) {
      return mensaje;
    } else {
      return "Error creando la categoría";
    }
  } catch (e) {
    return "Error: \$e";
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
