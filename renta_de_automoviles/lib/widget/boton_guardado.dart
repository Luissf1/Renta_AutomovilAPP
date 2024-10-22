import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BotonGuardar extends StatelessWidget {
  final String iconUrl;
  final Color color;
  const BotonGuardar({Key? key, required this.iconUrl, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 25,
      height: 25,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      child: SvgPicture.asset(iconUrl),
    );
  }
}
