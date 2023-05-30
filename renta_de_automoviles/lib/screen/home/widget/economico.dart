import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
import 'package:renta_de_automoviles/model/auto.dart';
import 'package:renta_de_automoviles/screen/detail/widget/barra_detalle.dart';
import 'package:renta_de_automoviles/widget/boton_guardado.dart';
import 'package:renta_de_automoviles/widget/caracteristicas.dart';

Stream<List<Auto>> readUsers() =>
    FirebaseFirestore.instance.collection('Auto').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Auto.fromJson(doc.data())).toList());

Widget buildUser(Auto auto) => ListTile(
      title: Text(auto.modelo),
      subtitle: Text(auto.Estado),
      /*subtitle: Text(auto.modelo),
      subtitle: Text(auto.categoria),
      subtitle: Text(auto.ubicacion),
      subtitle: Text(auto.asientos),
      subtitle: Text(auto.maletas),
      subtitle: Text(auto.puertas),
      subtitle: Text(auto.precio),
      subtitle: Text(auto.urlimagen),
      subtitle: Text(auto.transmision),
      subtitle: Text(auto.estereo),
      subtitle: Text(auto.frenos),*/
    );

class Economico extends StatefulWidget {
  @override
  State<Economico> createState() => _EconomicoState();
}

class _EconomicoState extends State<Economico> {
  List busquedaDisponible = [];

  void BusquedaDeFireBase() async {
    final resultado = await FirebaseFirestore.instance
        .collection('Auto')
        .where('Estado', isEqualTo: 'Disponible')
        .where('categoria', isEqualTo: 'Economico')
        .get();

    setState(() {
      busquedaDisponible = resultado.docs.map((e) => e.data()).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Auto>>(
      stream: readUsers(),
      builder: (context, snapshot) {
        BusquedaDeFireBase();
        if (snapshot.hasData && busquedaDisponible.isNotEmpty) {
          //final autos = snapshot.data!;
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
                                auto: busquedaDisponible[index],
                                //auto:autos[index],
                              );
                            },
                          ),
                        );
                      },
                      //Inicio
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
                                    image: NetworkImage(
                                      busquedaDisponible[index]['urlimagen'],
                                      //autos[index].urlimagen,
                                      //listarecomendada[index].urlimagen,
                                    ),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            Positioned(
                              left: 15,
                              top: 15,
                              child: Text(
                                busquedaDisponible[index]['categoria'],
                                //autos[index].categoria,
                                //listarecomendada[index].categoria,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1!
                                    .copyWith(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                            Positioned(
                                right: 15,
                                top: 15,
                                child: GestureDetector(
                                  onTap: () {
                                    final docGuardado = FirebaseFirestore
                                        .instance
                                        .collection('Auto')
                                        .doc(busquedaDisponible[index]['id']
                                            .trim());
                                    //.doc(autos[index].id.trim());

                                    //if (autos[index].Favorito == 'Si') {
                                    if (busquedaDisponible[index]['Favorito'] ==
                                        'Si') {
                                      BoxDecoration(color: Colors.grey);
                                      docGuardado.update({
                                        'Favorito': 'No',
                                      });
                                    } else {
                                      BoxDecoration(
                                          color: Theme.of(context).accentColor);
                                      docGuardado.update({
                                        'Favorito': 'Si',
                                      });
                                    }
                                  },
                                  child: BotonGuardar(
                                      iconUrl: 'assets/icons/guardar.svg',
                                      color: Colors.grey),
                                )),
                            Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  color: Colors.white54,
                                  padding: EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            busquedaDisponible[index]
                                                ['ubicacion'],
                                            //autos[index].ubicacion,
                                            //listarecomendada[index].ubicacion,
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
                                          Text(
                                              //('\$${autos[index].precio} MXN/Dia'),
                                              ('\$${busquedaDisponible[index]['precio']} MXN/Dia'),
                                              //listarecomendada[index].precio,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline1!
                                                  .copyWith(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                        ],
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            children: [
                                              Caracteristicas(
                                                  iconUrl:
                                                      'assets/icons/Pasajeros.png',
                                                  color: Theme.of(context)
                                                      .cardColor),
                                              Text(
                                                busquedaDisponible[index]
                                                    ['asientos'],
                                                //listarecomendada[index].asientos,
                                                //autos[index].asientos,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline1!
                                                    .copyWith(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                                  iconUrl:
                                                      'assets/icons/Maletas.png',
                                                  color: Theme.of(context)
                                                      .cardColor),
                                              Text(
                                                busquedaDisponible[index]
                                                    ['maletas'],
                                                //listarecomendada[index].maletas,
                                                //autos[index].maletas,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline1!
                                                    .copyWith(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                                  iconUrl:
                                                      'assets/icons/Puertas.png',
                                                  color: Theme.of(context)
                                                      .cardColor),
                                              Text(
                                                busquedaDisponible[index]
                                                    ['puertas'],
                                                //listarecomendada[index].puertas,
                                                //autos[index].puertas,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline1!
                                                    .copyWith(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
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
                      //Fin
                    ),
                separatorBuilder: (_, index) => SizedBox(height: 30),
                //itemCount: autos.length),
                itemCount: busquedaDisponible.length),
            //children: autos.map(buildUser).toList(),
          );
          //  );
        } else if (snapshot.hasError) {
          return Text('Algo salio mal! ${snapshot.error}');
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
