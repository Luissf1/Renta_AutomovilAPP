import 'package:flutter/material.dart';
import 'package:renta_de_automoviles/screen/home/widget/recomendados.dart';
import 'package:renta_de_automoviles/screen/home/widget/barra_menu.dart';

class Inicio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      //appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //WelcomeText(),
            //SearchInput(),
            Recomendados(),
            //Economico(),
            //Suv(),
            //Intermedio(),
          ],
        ),
      ),
      bottomNavigationBar: BarraMenu(),
    );
  }
}
