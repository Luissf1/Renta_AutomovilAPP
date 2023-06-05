import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../model/auto.dart';

class Calendario extends StatefulWidget {
  final Auto auto;
  const Calendario({Key? key, required this.auto}) : super(key: key);

  @override
  _CalendarioState createState() {
    return _CalendarioState();
  }
}

class _CalendarioState extends State<Calendario> {
  DateTimeRange fechaseleccionada =
      DateTimeRange(start: DateTime.now(), end: DateTime.now());

  @override
  Widget build(BuildContext) {
    return Center(
      child: GestureDetector(
        onTap: () async {
          final DateTimeRange? dateTimeRange = await showDateRangePicker(
            context: context,
            firstDate: DateTime.now(),
            lastDate: DateTime(2030),
          );
          if (dateTimeRange != null) {
            setState(() {
              fechaseleccionada = dateTimeRange;
            });
            CreateCalendar(
                FechaInicio: fechaseleccionada.start,
                FechaFin: fechaseleccionada.end);

            final docReservado = FirebaseFirestore.instance
                .collection('Auto')
                .doc(widget.auto.id.trim());

            docReservado.update({
              'FechaInicio':
                  '${fechaseleccionada.start.day}/${fechaseleccionada.start.month}/${fechaseleccionada.start.year}',
              'FechaFin':
                  '${fechaseleccionada.end.day}/${fechaseleccionada.end.month}/${fechaseleccionada.end.year}',
              'diasreservados': '${fechaseleccionada.duration.inDays}',
            });
          }
        },
        child: Text(
          "${fechaseleccionada.start.day}/${fechaseleccionada.start.month}/${fechaseleccionada.start.year}-${fechaseleccionada.end.day}/${fechaseleccionada.end.month}/${fechaseleccionada.end.year}",
          style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline),
        ),
      ),
    );
  }
}

Future CreateCalendar({
  required DateTime FechaFin,
  required DateTime FechaInicio,
}) async {
  final docUser = FirebaseFirestore.instance.collection('Reservaciones').doc();

  final calendar = Calendar(
    id: docUser.id,
    FechaFin: FechaFin,
    FechaInicio: FechaInicio,
  );
  final json = calendar.toJson();

  await docUser.set(json);
}

class Calendar {
  String id;
  final DateTime FechaFin;
  final DateTime FechaInicio;

  Calendar({
    this.id = "",
    required this.FechaFin,
    required this.FechaInicio,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'FechaFin': FechaFin,
        'FechaInicio': FechaInicio,
      };

  static Calendar fromJson(Map<String, dynamic> json) => Calendar(
        id: json['Favorito'],
        FechaFin: json['FechaFin'],
        FechaInicio: json['FechaInicio'],
      );
}
