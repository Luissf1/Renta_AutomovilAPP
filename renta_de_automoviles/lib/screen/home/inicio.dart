import 'package:flutter/material.dart';
import 'package:renta_de_automoviles/screen/home/widget/custom_app_bar.dart';
import 'package:renta_de_automoviles/screen/home/widget/search_input.dart';
import 'package:renta_de_automoviles/screen/home/widget/welcome_text.dart';
import 'package:renta_de_automoviles/screen/home/widget/recomendados.dart';

class Inicio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WelcomeText(),
            SearchInput(),
            Recomendados(),
          ],
        ),
      ),
    );
  }
}
