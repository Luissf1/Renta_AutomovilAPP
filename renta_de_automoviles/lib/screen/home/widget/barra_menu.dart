import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
}
