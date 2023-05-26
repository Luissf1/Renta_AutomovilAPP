import 'package:flutter/material.dart';
import 'package:renta_de_automoviles/screen/home/widget/barra_menu.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../home/inicio.dart';
import 'Notificaciones/Notificaciones.dart';

class Notificacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                        height: 28,
                        width: 28,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        child: SvgPicture.asset('assets/icons/regreso.svg'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Text(
              'Notificaciones',
              style: Theme.of(context).textTheme.headline1!.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(
              height: 18,
            ),
            Notificaciones(),
          ],
        ),
      ),
      bottomNavigationBar: BarraMenu(),
    );
  }
}
