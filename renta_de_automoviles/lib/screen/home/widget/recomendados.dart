import 'package:flutter/material.dart';
import 'package:renta_de_automoviles/model/auto.dart';
import 'package:renta_de_automoviles/screen/detail/widget/barra_detalle.dart';
import 'package:renta_de_automoviles/widget/boton_guardado.dart';
import 'package:renta_de_automoviles/widget/caracteristicas.dart';

class Recomendados extends StatelessWidget {
  final listarecomendada = Auto.Recomendados();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      child: ListView.separated(
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return BarraDetalle(
                          auto: listarecomendada[index],
                        );
                      },
                    ),
                  );
                },
                child: Container(
                  height: 280,
                  width: 300,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                listarecomendada[index].urlimagen,
                              ),
                              fit: BoxFit.cover),
                        ),
                      ),
                      Positioned(
                        left: 15,
                        top: 15,
                        child: Text(
                          listarecomendada[index].categoria,
                          style:
                              Theme.of(context).textTheme.headline1!.copyWith(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                      Positioned(
                          right: 15,
                          top: 15,
                          child: BotonGuardar(
                              iconUrl: 'assets/icons/guardar.svg',
                              color: Theme.of(context).accentColor)),
                      Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            color: Colors.white54,
                            padding: EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      listarecomendada[index].ubicacion,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(listarecomendada[index].precio,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1!
                                            .copyWith(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      children: [
                                        Caracteristicas(
                                            iconUrl:
                                                'assets/icons/Pasajeros.png',
                                            color: Theme.of(context).cardColor),
                                        Text(
                                          listarecomendada[index].asientos,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline1!
                                              .copyWith(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 2.5,
                                    ),
                                    Column(
                                      children: [
                                        Caracteristicas(
                                            iconUrl: 'assets/icons/Maletas.png',
                                            color: Theme.of(context).cardColor),
                                        Text(
                                          listarecomendada[index].maletas,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline1!
                                              .copyWith(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 2.5,
                                    ),
                                    Column(
                                      children: [
                                        Caracteristicas(
                                            iconUrl: 'assets/icons/Puertas.png',
                                            color: Theme.of(context).cardColor),
                                        Text(
                                          listarecomendada[index].puertas,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline1!
                                              .copyWith(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ))
                    ],
                  ),
                ),
              ),
          separatorBuilder: (_, index) => SizedBox(height: 30),
          itemCount: listarecomendada.length),
    );
  }
}
