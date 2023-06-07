import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:flutter/material.dart';

class Auto {
  String id;
  final String Estado;
  final String Favorito;
  final String modelo;
  final String categoria;
  final String ubicacion;
  final String asientos;
  final String maletas;
  final String puertas;
  final String precio;
  final String urlimagen;
  final String transmision;
  final String estereo;
  final String frenos;
  final String FechaFin;
  final String FechaInicio;
  final String diasreservados;

  Auto({
    this.id = '',
    required this.Estado,
    required this.Favorito,
    required this.modelo,
    required this.categoria,
    required this.ubicacion,
    required this.asientos,
    required this.maletas,
    required this.puertas,
    required this.precio,
    required this.urlimagen,
    required this.transmision,
    required this.estereo,
    required this.frenos,
    required this.FechaInicio,
    required this.FechaFin,
    required this.diasreservados,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'Favorito': Favorito,
        'Estado': Estado,
        'modelo': modelo,
        'categoria': categoria,
        'ubicacion': ubicacion,
        'asientos': asientos,
        'maletas': maletas,
        'puertas': puertas,
        'precio': precio,
        'urlimagen': urlimagen,
        'transmision': transmision,
        'estereo': estereo,
        'frenos': frenos,
        'FechaFin': FechaFin,
        'FechaInicio': FechaInicio,
        'diasreservados': diasreservados,
      };

  static Auto fromJson(Map<String, dynamic> json) => Auto(
        id: json['id'],
        Favorito: json['Favorito'],
        Estado: json['Estado'],
        modelo: json['modelo'],
        categoria: json['categoria'],
        ubicacion: json['ubicacion'],
        asientos: json['asientos'],
        maletas: json['maletas'],
        puertas: json['puertas'],
        precio: json['precio'],
        urlimagen: json['urlimagen'],
        transmision: json['transmision'],
        estereo: json['estereo'],
        frenos: json['frenos'],
        FechaFin: json['FechaFin'],
        FechaInicio: json['FechaInicio'],
        diasreservados: json['diasreservados'],
      );

  updateAuto() {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("Auto").doc(id);

    Map<String, dynamic> autos = {
      'id': 'Disponible',
    };
    documentReference.update(autos);
  }
}
