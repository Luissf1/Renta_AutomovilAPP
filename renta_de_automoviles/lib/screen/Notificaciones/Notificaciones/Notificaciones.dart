import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:renta_de_automoviles/model/auto.dart';

Stream<List<Auto>> readUsers() =>
    FirebaseFirestore.instance.collection('Auto').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Auto.fromJson(doc.data())).toList());

class Notificaciones extends StatefulWidget {
  @override
  State<Notificaciones> createState() => _NotificacionesState();
}

class _NotificacionesState extends State<Notificaciones> {
  List busquedaNotificacion = [];

  void BusquedaDeFireBase() async {
    final resultado = await FirebaseFirestore.instance
        .collection('Auto')
        .where('Estado', isEqualTo: 'Reservado')
        .get();

    setState(() {
      busquedaNotificacion = resultado.docs.map((e) => e.data()).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Auto>>(
      stream: readUsers(),
      builder: (context, snapshot) {
        BusquedaDeFireBase();
        if (snapshot.hasData && busquedaNotificacion.isNotEmpty) {
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
                                  busquedaNotificacion[index]['urlimagen']),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  busquedaNotificacion[index]['modelo'],
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline1!
                                      .copyWith(
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                Text(busquedaNotificacion[index]['ubicacion'],
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge!
                                        .copyWith(
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold)),
                                Text(
                                    '\$${busquedaNotificacion[index]['precio']} MXN',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge!
                                        .copyWith(
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold)),
                                SizedBox(
                                  height: 40,
                                ),
                                Text(
                                  'Reservado',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline1!
                                      .copyWith(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
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
                itemCount: busquedaNotificacion.length),
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
