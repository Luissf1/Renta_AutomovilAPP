import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:renta_de_automoviles/model/auto.dart';

import '../../home/inicio.dart';

CollectionReference collectionRef =
    FirebaseFirestore.instance.collection('Reservaciones');
DocumentReference docRef = collectionRef.doc('lcgn6Yvixl8XvdFhauVX');

// Crea un Widget Form
class MyCustomForm extends StatefulWidget {
  final Auto auto;
  //final Calendar calendar;
  const MyCustomForm({Key? key, required this.auto}) : super(key: key);

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Crea una clase State correspondiente. Esta clase contendrá los datos relacionados con
// el formulario.
class MyCustomFormState extends State<MyCustomForm> {
  final controller = TextEditingController();
  // Crea una clave global que identificará de manera única el widget Form
  // y nos permita validar el formulario
  //
  // Nota: Esto es un GlobalKey<FormState>, no un GlobalKey<MyCustomFormState>!
  final _formKey = GlobalKey<FormState>();

  Stream<List<Auto>> readUser() => FirebaseFirestore.instance
      .collection('Auto')
      .where('Estado', isEqualTo: 'Disponible')
      .where('modelo', isEqualTo: widget.auto.modelo)
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Auto.fromJson(doc.data())).toList());

  List busquedaDisponible = [];

  @override
  Widget build(BuildContext context) {
    Widget Operaciones(Auto auto) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Detalles de total',
              style: Theme.of(context).textTheme.headline1!.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(
              height: 18,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$${auto.precio} x ${auto.diasreservados} dias',
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .copyWith(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                //Text('\$${subtotal.toStringAsFixed(2)}',
                Text(
                    '\$${(double.parse(auto.precio) * double.parse(auto.diasreservados)).toStringAsFixed(2)}',
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge!
                        .copyWith(fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(
              height: 18,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Seguro',
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .copyWith(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text('\$200.00',
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge!
                        .copyWith(fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(
              height: 18,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .copyWith(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                    '\$${((double.parse(auto.precio) * double.parse(auto.diasreservados)) + 200).toStringAsFixed(2)}',
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge!
                        .copyWith(fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(
              height: 18,
            ),
            Text(
              'Fecha',
              style: Theme.of(context).textTheme.headline1!.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(
              height: 18,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('${auto.FechaInicio}-${auto.FechaFin}',
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge!
                        .copyWith(fontSize: 16, fontWeight: FontWeight.bold)),

                //Calendario(),
              ],
            )
          ],
        );

    final Controllernombre = TextEditingController();
    final Controllerapellido = TextEditingController();
    final Controllercorreo = TextEditingController();
    final Controllertelefono = TextEditingController();
    // Crea un widget Form usando el _formKey que creamos anteriormente
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Nombres',
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(fontSize: 16, fontWeight: FontWeight.bold)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              controller: Controllernombre,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Ingrese su nombre',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Por favor ingrese su nombre';
                }
              },
            ),
          ),
          Text('Apellidos',
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(fontSize: 16, fontWeight: FontWeight.bold)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              controller: Controllerapellido,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Ingrese sus apellidos',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Por favor ingrese sus apellidos';
                }
              },
            ),
          ),
          Text('Correo',
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(fontSize: 16, fontWeight: FontWeight.bold)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              controller: Controllercorreo,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Ingrese su correo',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Por favor ingrese su correo';
                }
              },
            ),
          ),
          Text('Telefono',
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(fontSize: 16, fontWeight: FontWeight.bold)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              controller: Controllertelefono,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Ingrese su telefono',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Por favor ingrese su telefono';
                }
              },
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StreamBuilder<List<Auto>>(
                  stream: readUser(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final autos = snapshot.data!;
                      return Column(
                        children: autos.map(Operaciones).toList(),
                      );
                    } else if (snapshot.hasError) {
                      return Text('Error ${snapshot.error}');
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                final user = User(
                    nombre: Controllernombre.text,
                    apellido: Controllerapellido.text,
                    correo: Controllercorreo.text,
                    telefono: Controllertelefono.text);

                if (_formKey.currentState!.validate()) {
                  // Si el formulario es válido, queremos mostrar un Snackbar
                  //ScaffoldMessenger.of(context).showSnackBar;
                  createUser(user);

                  final docReservado = FirebaseFirestore.instance
                      .collection('Auto')
                      .doc(widget.auto.id.trim());

                  docReservado.update({
                    'Estado': 'Reservado',
                    'Favorito': 'No',
                  });

                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Reservado'),
                      content: Text('Se ha reservado de forma exitosa'),
                      actions: [
                        TextButton(
                          child: Text('OK'),
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Inicio(),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                primary: Theme.of(context).primaryColor,
              ),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 17),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Reservar',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Future createUser(User user) async {
  final docUser = FirebaseFirestore.instance.collection('Usuarios').doc();
  user.id = docUser.id;

  final json = user.toJson();
  await docUser.set(json);
}

class User {
  String id;
  final String nombre;
  final String apellido;
  final String correo;
  final String telefono;

  User({
    this.id = "",
    required this.nombre,
    required this.apellido,
    required this.correo,
    required this.telefono,
  });
  Map<String, dynamic> toJson() => {
        'id': id,
        'nombre': nombre,
        'apellido': apellido,
        'correo': correo,
        'telefono': telefono,
      };
}
