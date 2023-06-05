import 'package:flutter/material.dart';
import 'package:renta_de_automoviles/model/auto.dart';
import 'package:renta_de_automoviles/screen/detail/widget/barra_detalle.dart';
import 'package:renta_de_automoviles/widget/calendario.dart';

class PaginaDetalle extends StatelessWidget {
  final Auto auto;
  const PaginaDetalle({Key? key, required this.auto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BarraDetalle(auto: auto),
          ],
        ),
      ),
    );
  }
}
