import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:renta_de_automoviles/model/auto.dart';
import 'package:renta_de_automoviles/screen/Formulario/form.dart';
import 'package:renta_de_automoviles/screen/detail/widget/Botones.dart';
import 'package:renta_de_automoviles/widget/calendario.dart';

class BarraDetalle extends StatefulWidget {
  final Auto auto;
  const BarraDetalle({Key? key, required this.auto}) : super(key: key);

  @override
  State<BarraDetalle> createState() => _BarraDetalleState();
}

class _BarraDetalleState extends State<BarraDetalle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              SafeArea(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          height: 28,
                          width: 28,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.grey, shape: BoxShape.circle),
                          child: SvgPicture.asset('assets/icons/regreso.svg'),
                        ),
                      ),
                      Container(
                        height: 28,
                        width: 28,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.grey, shape: BoxShape.circle),
                        child: SvgPicture.asset('assets/icons/guardar.svg'),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: Column(children: [
                  Image.network(
                    widget.auto.urlimagen,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ]),
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(widget.auto.modelo,
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                            fontSize: 30, fontWeight: FontWeight.bold)),
                    Text(widget.auto.ubicacion,
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .copyWith(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  'Caracteristicas',
                  style: Theme.of(context).textTheme.headline1!.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Container(
                alignment: Alignment.center,
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Transmision',
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                      Text('Pasajeros',
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                      Text('Estereo',
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(widget.auto.transmision,
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                      Text(widget.auto.asientos,
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                      Text(widget.auto.estereo,
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Maletas',
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                      Text('Puertas',
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                      Text('Frenos',
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(widget.auto.maletas,
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                      Text(widget.auto.puertas,
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                      Text(widget.auto.frenos,
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(
                    height: 18,
                  ),
                ]),
              ),
              Container(
                  alignment: Alignment.topLeft,
                  child: Column(
                    children: [
                      Text(
                        'Seguro y proteccion',
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  )),
              SizedBox(
                height: 18,
              ),
              MyStatefulWidget(),
              Container(
                child: Row(children: [
                  GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                title: Text('Terminos y condiciones'),
                                content: Text(
                                    'La renta de automóviles está sujeta a disponibilidad y se recomienda hacer una reservación con anticipación para garantizar la disponibilidad del vehículo deseado.'),
                                actions: [
                                  TextButton(
                                      child: Text('OK'),
                                      onPressed: () => Navigator.pop(context))
                                ],
                              ));
                    },
                    child: Text(
                      'Terminos y condiciones',
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                      textAlign: TextAlign.left,
                    ),
                  )
                ]),
              ),
              SizedBox(
                height: 18,
              ),
              Container(
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaginaForm(auto: widget.auto),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    primary: Theme.of(context).primaryColor,
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                ('${widget.auto.precio} Mxn/dia'),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Calendario(),
                            ],
                          ),
                          Text(
                            'Reservar',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
