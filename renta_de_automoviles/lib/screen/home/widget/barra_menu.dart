import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
//import 'package:renta_de_automoviles/screen/Notificaciones/Notificaciones/Notificaciones.dart';
import 'package:renta_de_automoviles/screen/Reservaciones/form.dart';
import 'package:renta_de_automoviles/screen/home/inicio.dart';

import '../../Guardado/form.dart';
import '../../Notificaciones/form.dart';

/*
class BarraMenu extends StatelessWidget {
  final items = ['search_barra', 'agenda', 'notificacion', 'guardar_barra'];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 7,
              offset: Offset(0, 3),
            )
          ]),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: items
              .map((e) => SvgPicture.asset(
                    'assets/icons/$e.svg',
                    color: Theme.of(context).primaryColor,
                  ))
              .toList()),
    );
  }
}*/

class BarraMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 7,
              offset: Offset(0, 3),
            )
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Inicio(),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.only(left: 35),
              height: 28,
              width: 28,
              child: SvgPicture.asset('assets/icons/search_barra.svg'),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Reservacion()),
              );
            },
            child: Container(
              height: 28,
              width: 28,
              child: SvgPicture.asset('assets/icons/agenda.svg'),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Notificacion()),
              );
            },
            child: Container(
              height: 28,
              width: 28,
              child: SvgPicture.asset('assets/icons/notificacion.svg'),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Guardado()),
              );
            },
            child: Container(
              margin: EdgeInsets.only(right: 35),
              height: 28,
              width: 28,
              child: SvgPicture.asset('assets/icons/guardar_barra.svg'),
            ),
          ),
        ],
      ),
    );
  }
}
