import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:flutter/material.dart';

class Auto {
  String id;
  late final String Estado;
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

  Auto({
    this.id = '',
    required this.Estado,
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
  });

  Map<String, dynamic> toJson() => {
        'id': id,
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
      };

  static Auto fromJson(Map<String, dynamic> json) => Auto(
      id: json['id'],
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
      frenos: json['frenos']);
}

/*
class Auto {
  String modelo;
  String categoria;
  String ubicacion;
  String asientos;
  String maletas;
  String puertas;
  String precio;
  String urlimagen;
  String transmision;
  String estereo;
  String frenos;

  Auto(
      this.modelo,
      this.categoria,
      this.ubicacion,
      this.asientos,
      this.maletas,
      this.puertas,
      this.precio,
      this.urlimagen,
      this.transmision,
      this.estereo,
      this.frenos);

  static List<Auto> Recomendados() {
    return [
      Auto(
          'Nissan March',
          'Economico',
          'Tijuana B.C.',
          '5',
          '2',
          '5',
          '\$' + '348' + ' ' + 'MXN/dia',
          'assets/images/March.jpg',
          'Manual',
          'Radio AM/FM',
          'ABS'),
      Auto(
          'Chevrolet Aveo',
          'Compacto',
          'Mexicali B.C.',
          '6',
          '2',
          '5',
          '\$' + '509' + ' ' + 'MXN/dia',
          'assets/images/versa.jpg',
          'Manual',
          'Radio AM/FM',
          'ABS'),
      Auto(
          'Nissan Versa',
          'Intermedio',
          'Ensenada B.C.',
          '6',
          '2',
          '5',
          '\$' + '570' + ' ' + 'MXN/dia',
          'assets/images/versa.jpg',
          'Manual',
          'Radio AM/FM',
          'ABS'),
    ];
  }
}*/
