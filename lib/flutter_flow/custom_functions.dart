import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

String? newCustomFunction(
  double? num1,
  int? num2,
) {
  int sumar(
    String num1,
    String num2,
  ) {
    int num1Convertido = int.parse(num1);
    int num2Convertido = int.parse(num2);
    int total = num1Convertido + num2Convertido;
    return total;
  }
}

double sumarSubtotal(
  double valorSubtotal,
  double precio,
) {
  valorSubtotal = valorSubtotal + precio;
  return valorSubtotal;
}

double totalList(List<double> subTotal) {
  double total = 0;
  for (double add in subTotal) {
    total += add;
  }

  return total;
}

double calcularSubTotal(
  double precio,
  int cantidad,
) {
  return precio * cantidad;
}

double restarSubtotal(
  double valorSubtotal,
  double precio,
) {
  if (valorSubtotal > 0) {
    valorSubtotal = valorSubtotal - precio;
  }

  return valorSubtotal;
}

double iva(List<double> subTotal) {
  double total = 0;
  for (double add in subTotal) {
    total += add;
  }

  total -= total * 0.87;

  return total;
}

int totalConIVA(List<double> subTotal) {
  double total = 0;
  for (double add in subTotal) {
    total += add;
  }

  total *= 1.13;
  return total.round();
}

double? costoCatering(
  int cantidad,
  double precio,
) {
  return precio * cantidad;
}

String uRLwsp(
  String nombCom,
  String numTelefono,
  int cantPer,
  String direccion,
  String email,
  String? platillo,
) {
  String message =
      'Hola, quisiera confirmar mi reserva con los siguientes datos, quedo atent@ a la cotización:%0A%0A';
  message += 'Nombre: $nombCom%0A';
  message += 'Teléfono: $numTelefono%0A';
  message += 'Cantidad de personas: $cantPer%0A';
  message += 'Dirección: $direccion%0A';
  message += 'Email: $email%0A';

  if (platillo != null && platillo.isNotEmpty) {
    message += 'Platillo: $platillo%0A';
  }

  // Hay que cambiar el numero por el del cliente.
  String url = 'https://api.whatsapp.com/send?phone=50661018372&text=$message';
  return url;
}
