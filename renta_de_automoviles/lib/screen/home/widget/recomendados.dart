import 'package:flutter/material.dart';
import 'package:renta_de_automoviles/model/auto.dart';

class Recomendados extends StatelessWidget {
  final listarecomendada = Auto.Recomendados();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 340,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Container(
                height: 300,
                width: 230,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Image.asset(listarecomendada[index].urlimagen),
              ),
          separatorBuilder: (_, index) => SizedBox(width: 30),
          itemCount: listarecomendada.length),
    );
  }
}
