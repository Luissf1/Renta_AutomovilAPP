import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:renta_de_automoviles/model/auto.dart';
import 'package:renta_de_automoviles/screen/Formulario/widget/formulario.dart';
import 'package:renta_de_automoviles/widget/calendario.dart';

import '../home/inicio.dart';

class PaginaForm extends StatelessWidget {
  final Auto auto;
  const PaginaForm({Key? key, required this.auto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
              'Reservacion',
              style: Theme.of(context).textTheme.headline1!.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(
              height: 18,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 150,
                  width: 250,
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Image.network(auto.urlimagen),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      auto.modelo,
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Text(auto.ubicacion,
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .copyWith(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Editar',
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 18,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Datos Personales',
                  style: Theme.of(context).textTheme.headline1!.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
            SizedBox(
              height: 18,
            ),
            MyCustomForm(auto: auto),
          ],
        ),
      ),
    );
  }
}
