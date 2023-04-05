import 'package:flutter/material.dart';

class Caracteristicas extends StatelessWidget {
  final String iconUrl;
  final Color color;
  const Caracteristicas({Key? key, required this.iconUrl, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 38,
      height: 38,
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      child: Image.asset(iconUrl),
    );
  }
}
