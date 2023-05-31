import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
//import 'package:flutter/widgets.dart';
import 'package:renta_de_automoviles/model/auto.dart';
import 'package:renta_de_automoviles/screen/detail/widget/barra_detalle.dart';
import 'package:renta_de_automoviles/widget/boton_guardado.dart';
import 'package:renta_de_automoviles/widget/caracteristicas.dart';
//import '../inicio.dart';

/*
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
}*/

/*
class Recomendados extends StatelessWidget {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Auto>>(
      stream: readUsers(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final autos = snapshot.data!;
          return ListView(
            children: autos.map(buildUser).toList(),
          );
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
*/

/*Widget buildUser(Auto auto) => ListTile(
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
    */

enum _MenuValue {
  Todos,
  Economico,
  Intermedio,
  Suv,
}

String CategoriaAuto = 'Recomendados';

Stream<List<Auto>> readUser() => stream;

var stream = FirebaseFirestore.instance
    .collection('Auto')
    .where('Estado', isEqualTo: 'Disponible')
    .snapshots()
    .map((snapshot) =>
        snapshot.docs.map((doc) => Auto.fromJson(doc.data())).toList());

/*Stream<List<Auto>> Function() readUser =
    readUsersRecomendados() as Stream<List<Auto>> Function();

Stream<List<Auto>> readUsersRecomendados() => FirebaseFirestore.instance
    .collection('Auto')
    .where('Estado', isEqualTo: 'Disponible')
    .snapshots()
    .map((snapshot) =>
        snapshot.docs.map((doc) => Auto.fromJson(doc.data())).toList());

Stream<List<Auto>> readUsersEconomicos() => FirebaseFirestore.instance
    .collection('Auto')
    .where('Estado', isEqualTo: 'Disponible')
    .where('categoria', isEqualTo: 'Economico')
    .snapshots()
    .map((snapshot) =>
        snapshot.docs.map((doc) => Auto.fromJson(doc.data())).toList());

Stream<List<Auto>> readUsersIntermedio() => FirebaseFirestore.instance
    .collection('Auto')
    .where('Estado', isEqualTo: 'Disponible')
    .where('categoria', isEqualTo: 'Intermedio')
    .snapshots()
    .map((snapshot) =>
        snapshot.docs.map((doc) => Auto.fromJson(doc.data())).toList());

Stream<List<Auto>> readUsersSuv() => FirebaseFirestore.instance
    .collection('Auto')
    .where('Estado', isEqualTo: 'Disponible')
    .where('categoria', isEqualTo: 'Suv')
    .snapshots()
    .map((snapshot) =>
        snapshot.docs.map((doc) => Auto.fromJson(doc.data())).toList());
*/
/*
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
*/

class Recomendados extends StatefulWidget {
  @override
  State<Recomendados> createState() => _RecomendadosState();
}

class _RecomendadosState extends State<Recomendados> {
  List busquedaDisponible = [];

  void BusquedaDeFireBase() async {
    if (CategoriaAuto == 'Recomendados') {
      final resultado = await FirebaseFirestore.instance
          .collection('Auto')
          .where('Estado', isEqualTo: 'Disponible')
          .get();

      setState(() {
        busquedaDisponible = resultado.docs.map((e) => e.data()).toList();
      });
    } else if (CategoriaAuto == 'Economico') {
      final resultado = await FirebaseFirestore.instance
          .collection('Auto')
          .where('Estado', isEqualTo: 'Disponible')
          .where('categoria', isEqualTo: 'Economico')
          .get();

      setState(() {
        busquedaDisponible = resultado.docs.map((e) => e.data()).toList();
      });
    } else if (CategoriaAuto == 'Intermedio') {
      final resultado = await FirebaseFirestore.instance
          .collection('Auto')
          .where('Estado', isEqualTo: 'Disponible')
          .where('categoria', isEqualTo: 'Intermedio')
          .get();

      setState(() {
        busquedaDisponible = resultado.docs.map((e) => e.data()).toList();
      });
    } else if (CategoriaAuto == 'Suv') {
      final resultado = await FirebaseFirestore.instance
          .collection('Auto')
          .where('Estado', isEqualTo: 'Disponible')
          .where('categoria', isEqualTo: 'Suv')
          .get();

      setState(() {
        busquedaDisponible = resultado.docs.map((e) => e.data()).toList();
      });
    } else {
      final resultado = await FirebaseFirestore.instance
          .collection('Auto')
          .where('Estado', isEqualTo: 'Disponible')
          .get();

      setState(() {
        busquedaDisponible = resultado.docs.map((e) => e.data()).toList();
      });
    }
  }

/*
  void BusquedaDeFireBaseEconmico() async {
    final resultado = await FirebaseFirestore.instance
        .collection('Auto')
        .where('Estado', isEqualTo: 'Disponible')
        .where('categoria', isEqualTo: 'Economico')
        .get();

    setState(() {
      busquedaDisponible = resultado.docs.map((e) => e.data()).toList();
    });
  }

  void BusquedaDeFireBaseIntermedio() async {
    final resultado = await FirebaseFirestore.instance
        .collection('Auto')
        .where('Estado', isEqualTo: 'Disponible')
        .where('categoria', isEqualTo: 'Intermedio')
        .get();

    setState(() {
      busquedaDisponible = resultado.docs.map((e) => e.data()).toList();
    });
  }

  void BusquedaDeFireBaseSuv() async {
    final resultado = await FirebaseFirestore.instance
        .collection('Auto')
        .where('Estado', isEqualTo: 'Disponible')
        .where('categoria', isEqualTo: 'Suv')
        .get();

    setState(() {
      busquedaDisponible = resultado.docs.map((e) => e.data()).toList();
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PopupMenuButton<_MenuValue>(
                  /*icon: Icon(
                Icons.more,
                color: Colors.green,
              ),*/
                  icon: SvgPicture.asset('assets/icons/menu.svg'),
                  itemBuilder: (BuildContext context) => [
                    PopupMenuItem(
                      child: Text('Recomendados'),
                      value: _MenuValue.Todos,
                    ),
                    PopupMenuItem(
                      child: Text('Economico'),
                      value: _MenuValue.Economico,
                    ),
                    PopupMenuItem(
                      child: Text('Intermedio'),
                      value: _MenuValue.Intermedio,
                    ),
                    PopupMenuItem(
                      child: Text('Suv'),
                      value: _MenuValue.Suv,
                    ),
                  ],
                  onSelected: ((value) {
                    switch (value) {
                      case _MenuValue.Todos:
                        print('Recomendados');
                        CategoriaAuto = 'Recomendados';
                        stream = FirebaseFirestore.instance
                            .collection('Auto')
                            .where('Estado', isEqualTo: 'Disponible')
                            .snapshots()
                            .map((snapshot) => snapshot.docs
                                .map((doc) => Auto.fromJson(doc.data()))
                                .toList());
                        break;
                      case _MenuValue.Economico:
                        print('Economico');
                        CategoriaAuto = 'Economico';
                        stream = FirebaseFirestore.instance
                            .collection('Auto')
                            .where('Estado', isEqualTo: 'Disponible')
                            .where('categoria', isEqualTo: 'Economico')
                            .snapshots()
                            .map((snapshot) => snapshot.docs
                                .map((doc) => Auto.fromJson(doc.data()))
                                .toList());
                        break;
                      case _MenuValue.Intermedio:
                        print('Intermedio');
                        CategoriaAuto = 'Intermedio';
                        stream = FirebaseFirestore.instance
                            .collection('Auto')
                            .where('Estado', isEqualTo: 'Disponible')
                            .where('categoria', isEqualTo: 'Intermedio')
                            .snapshots()
                            .map((snapshot) => snapshot.docs
                                .map((doc) => Auto.fromJson(doc.data()))
                                .toList());
                        break;
                      case _MenuValue.Suv:
                        print('Suv');
                        CategoriaAuto = 'Suv';
                        stream = FirebaseFirestore.instance
                            .collection('Auto')
                            .where('Estado', isEqualTo: 'Disponible')
                            .where('categoria', isEqualTo: 'Suv')
                            .snapshots()
                            .map((snapshot) => snapshot.docs
                                .map((doc) => Auto.fromJson(doc.data()))
                                .toList());
                        break;
                      default:
                        print('Recomendados');
                        CategoriaAuto = 'Recomendados';
                        stream = FirebaseFirestore.instance
                            .collection('Auto')
                            .where('Estado', isEqualTo: 'Disponible')
                            .snapshots()
                            .map((snapshot) => snapshot.docs
                                .map((doc) => Auto.fromJson(doc.data()))
                                .toList());
                        break;
                    }
                  }),
                ),
                /*IconButton(
                onPressed: () {
                  Center(
                    child: 
                    DropdownButton<String>(
                      value: value,
                      items: items.map(buildMenuItem).toList(),
                      onChanged: (value) => setState(() => this.value = value),
                    ),
                  );
                },
                icon: SvgPicture.asset('assets/icons/menu.svg')),*/
                IconButton(
                    onPressed: () {},
                    icon: Image.asset('assets/icons/user.png'))
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Bienvenido',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  'Encuentra el mejor auto',
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(fontSize: 20, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(15),
            child: TextField(
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: 'Ingrese ubicacion ...',
                  prefixIcon: Container(
                    padding: EdgeInsets.all(15),
                    child: SvgPicture.asset('assets/icons/search.svg'),
                  ),
                  contentPadding: EdgeInsets.all(2)),
            ),
          ),
          StreamBuilder<List<Auto>>(
            stream: readUser(),
            builder: (context, snapshot) {
              BusquedaDeFireBase();
              if (snapshot.hasData && busquedaDisponible.isNotEmpty) {
                final autos = snapshot.data!;
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
                                      //auto: busquedaDisponible[index],
                                      auto: autos[index],
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
                                            busquedaDisponible[index]
                                                ['urlimagen'],
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
                                              .doc(busquedaDisponible[index]
                                                      ['id']
                                                  .trim());
                                          //.doc(autos[index].id.trim());

                                          //if (autos[index].Favorito == 'Si') {
                                          if (busquedaDisponible[index]
                                                  ['Favorito'] ==
                                              'Si') {
                                            BoxDecoration(color: Colors.grey);
                                            docGuardado.update({
                                              'Favorito': 'No',
                                            });
                                          } else {
                                            BoxDecoration(
                                                color: Theme.of(context)
                                                    .accentColor);
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
                                                        fontWeight:
                                                            FontWeight.bold,
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
                                                                FontWeight
                                                                    .bold)),
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
          ),
        ],
      ),
    );
  }
}
