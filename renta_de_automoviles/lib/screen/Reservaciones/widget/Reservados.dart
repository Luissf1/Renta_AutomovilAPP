import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:renta_de_automoviles/model/auto.dart';
import 'package:renta_de_automoviles/screen/detail/widget/barra_detalle.dart';

import '../../home/inicio.dart';
//import 'package:renta_de_automoviles/widget/boton_guardado.dart';
//import 'package:renta_de_automoviles/widget/caracteristicas.dart';

Stream<List<Auto>> readUsers() =>
    FirebaseFirestore.instance.collection('Auto').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Auto.fromJson(doc.data())).toList());

class Reservados extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Auto>>(
      stream: readUsers(),
      builder: (context, snapshot) {
        if (snapshot.hasData /*&& auto.Estado.startsWith('Disponible')*/) {
          final autos = snapshot.data!;
          return Container(
            height: 500,
            child: ListView.separated(
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        /*Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return BarraDetalle(
                                auto: autos[index],
                              );
                            },
                          ),
                        );*/
                      },
                      //Inicio
                      child: Container(
                        height: 150,
                        width: 300,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 300,
                              width: 240,
                              alignment: Alignment.topLeft,
                              padding: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Image.network(autos[index].urlimagen),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  autos[index].modelo,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline1!
                                      .copyWith(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                Text(autos[index].ubicacion,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge!
                                        .copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)),
                                SizedBox(
                                  height: 10,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                              title:
                                                  Text('Reservacion Cancelada'),
                                              content: Text(
                                                  'Su reservacion a sido cancelada'),
                                              actions: [
                                                TextButton(
                                                  child: Text('OK'),
                                                  onPressed: () =>
                                                      Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          Inicio(),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ));
                                  },
                                  child: Text(
                                    'Cancelar',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1!
                                        .copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      //Fin
                    ),
                separatorBuilder: (_, index) => SizedBox(height: 30),
                itemCount: autos.length),
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
