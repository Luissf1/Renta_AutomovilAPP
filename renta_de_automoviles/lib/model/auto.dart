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

  Auto(this.modelo, this.categoria, this.ubicacion, this.asientos, this.maletas,
      this.puertas, this.precio, this.urlimagen);

  static List<Auto> Recomendados() {
    return [
      Auto('March', 'Economico', 'Tijuana B.C.', '6', '2', '5',
          '348' + ' ' + 'MXN/dia', 'assets/images/March.jpg'),
      Auto('Beat', 'Economico', 'Mexicali B.C.', '6', '2', '5',
          '348' + ' ' + 'MXN/dia', 'assets/images/March.jpg'),
      Auto('Beat', 'Economico', 'Ensenada B.C.', '6', '2', '5',
          '348' + ' ' + 'MXN/dia', 'assets/images/March.jpg')
    ];
  }
}
