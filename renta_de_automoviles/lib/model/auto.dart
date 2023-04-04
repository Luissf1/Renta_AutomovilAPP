import 'package:flutter/material.dart';

class Auto {
  String modelo;
  String categoria;
  String ubicacion;
  int asientos;
  int maletas;
  int puertas;
  String urlimagen;

  Auto(this.modelo, this.categoria, this.ubicacion, this.asientos, this.maletas,
      this.puertas, this.urlimagen);

  static List<Auto> Recomendados() {
    return [
      Auto('March', 'Economico', 'Tijuana B.C.', 6, 2, 5,
          'assets/images/March.jpg'),
      Auto('Beat', 'Economico', 'Mexicali B.C.', 6, 2, 5,
          'assets/images/March.jpg'),
      Auto('Beat', 'Economico', 'Ensenada B.C.', 6, 2, 5,
          'assets/images/March.jpg')
    ];
  }
}
