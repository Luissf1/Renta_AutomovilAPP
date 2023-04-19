import 'package:flutter/material.dart';
import 'package:renta_de_automoviles/model/auto.dart';
import 'package:renta_de_automoviles/widget/calendario.dart';

// ignore: must_be_immutable
class Reservar extends StatelessWidget {
  final Auto auto;
  Reservar({Key? key, required this.auto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          primary: Theme.of(context).primaryColor,
        ),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 15),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  auto.precio,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Calendario(),
              ],
            ),
            Text(
              'Reservar',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ]),
        ),
      ),
    );
  }
}
