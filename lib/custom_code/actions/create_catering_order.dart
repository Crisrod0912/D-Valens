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

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<String> createCateringOrder(
  String correo,
  String numTelefono,
  String nombCom,
  int cantPer,
  String platillo,
  String direccion,
) async {
  String mensaje = "Orden de catering creada";
  DateTime created_time = DateTime.now();

  try {
    final CollectionReference<Map<String, dynamic>> cateringCollection =
        FirebaseFirestore.instance.collection('Catering');

    await cateringCollection.add(<String, dynamic>{
      'email': correo,
      'NumTelefono': numTelefono,
      'NombCom': nombCom,
      'cantPer': cantPer,
      'platillo': platillo,
      'created_time': created_time.toIso8601String(),
      'direccion': direccion,
    });
    return mensaje;
  } catch (e) {
    return "Error creando la orden de catering: \$e";
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
