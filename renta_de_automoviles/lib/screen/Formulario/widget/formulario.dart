import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// Crea un Widget Form
class MyCustomForm extends StatefulWidget {
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

  @override
  Widget build(BuildContext context) {
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
          /*
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // devolverá true si el formulario es válido, o falso si
                // el formulario no es válido.
                if (_formKey.currentState!.validate()) {
                  // Si el formulario es válido, queremos mostrar un Snackbar
                  ScaffoldMessenger.of(context).showSnackBar;
                }
              },
              child: Text('Enviar'),
            ),
          ),*/
          Column(
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    '\$348 mxn x 8 dias',
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge!
                        .copyWith(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text('\$2,784.00',
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
                  Text('\$2,784.00',
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .copyWith(fontSize: 16, fontWeight: FontWeight.bold)),
                ],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                /*
                final nombre = controller.text;
                final apellido = controller.text;
                final correo = controller.text;
                final telefono = controller.text;

                CreateUser(
                    nombre: nombre,
                    apellido: apellido,
                    correo: correo,
                    telefono: telefono);*/

                final user = User(
                    nombre: Controllernombre.text,
                    apellido: Controllerapellido.text,
                    correo: Controllercorreo.text,
                    telefono: Controllertelefono.text);

                createUser(user);

                if (_formKey.currentState!.validate()) {
                  // Si el formulario es válido, queremos mostrar un Snackbar
                  //ScaffoldMessenger.of(context).showSnackBar;
                }

                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Reservado'),
                    content: Text('Se ha reservado de forma exitosa'),
                    actions: [
                      TextButton(
                        child: Text('OK'),
                        onPressed: () => Navigator.pop(context),
                      )
                    ],
                  ),
                );
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

/*
Future CreateUser(
    {required String nombre,
    required String apellido,
    required String correo,
    required String telefono}) async {
  final docUser =
      FirebaseFirestore.instance.collection('Usuarios').doc('my-id');

  final json = {
    'nombre': nombre,
    'apellido': apellido,
    'correo': correo,
    'telefono': 'prueba',
  };

  await docUser.set(json);
}*/
/*
Future CreateUser(
    {required String nombre,
    required String apellido,
    required String correo,
    required String telefono}) async {
  final docUser = FirebaseFirestore.instance.collection('Usuarios').doc();

  final user = User(
    id: docUser.id,
    nombre: nombre,
    apellido: apellido,
    correo: correo,
    telefono: telefono,
  );
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
}*/

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
