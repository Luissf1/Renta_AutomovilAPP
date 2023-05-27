import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchInput extends StatefulWidget {
  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
