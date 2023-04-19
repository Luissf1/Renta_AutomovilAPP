import 'package:flutter/material.dart';

class Calendario extends StatefulWidget {
  const Calendario({Key? key}) : super(key: key);

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
