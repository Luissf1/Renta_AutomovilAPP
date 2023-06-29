import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:renta_de_automoviles/model/auto.dart';
import '../../home/inicio.dart';

Stream<List<Auto>> readUsers() => FirebaseFirestore.instance
    .collection('Auto')
    .where('Estado', isEqualTo: 'Reservado')
    .snapshots()
    .map((snapshot) =>
        snapshot.docs.map((doc) => Auto.fromJson(doc.data())).toList());

class Reservados extends StatefulWidget {
  @override
  State<Reservados> createState() => _ReservadosState();
}

class _ReservadosState extends State<Reservados> {
  List busquedaReservados = [];

  void BusquedaDeFireBase() async {
    final resultado = await FirebaseFirestore.instance
        .collection('Auto')
        .where('Estado', isEqualTo: 'Reservado')
        .get();

    setState(() {
      busquedaReservados = resultado.docs.map((e) => e.data()).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Auto>>(
      stream: readUsers(),
      builder: (context, snapshot) {
        BusquedaDeFireBase();
        if (snapshot.hasData && busquedaReservados.isNotEmpty) {
          //final autos = snapshot.data!;
          return Container(
            height: 500,
            child: ListView.separated(
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) => GestureDetector(
                      onTap: () {},
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
                              child: Image.network(
                                  busquedaReservados[index]['urlimagen']),
                              //autos[index].urlimagen
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  //autos[index].modelo,
                                  busquedaReservados[index]['modelo'],
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline1!
                                      .copyWith(
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                Text(
                                    //autos[index].ubicacion,
                                    busquedaReservados[index]['ubicacion'],
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge!
                                        .copyWith(
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold)),
                                Text(
                                    //'${autos[index].precio} MXN',
                                    '\$${busquedaReservados[index]['precio']} MXN',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge!
                                        .copyWith(
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold)),
                                SizedBox(
                                  height: 10,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    final docCancelado = FirebaseFirestore
                                        .instance
                                        .collection('Auto')
                                        .doc(busquedaReservados[index]['id']
                                            .trim());

                                    docCancelado.update({
                                      'Estado': 'Disponible',
                                      'FechaInicio': '',
                                      'FechaFin': '',
                                      'diasreservados': '',
                                    });

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
                            ),
                          ],
                        ),
                      ),
                      //Fin
                    ),
                separatorBuilder: (_, index) => SizedBox(height: 30),
                itemCount: busquedaReservados.length),
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
