import 'package:flutter/material.dart';

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
          '6',
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
}
