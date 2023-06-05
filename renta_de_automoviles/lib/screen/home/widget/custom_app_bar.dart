import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../inicio.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(50);
}

enum _MenuValue {
  Todos,
  Economico,
  Intermedio,
  Suv,
}

class _CustomAppBarState extends State<CustomAppBar> {
  //final items = ['Todos', 'Economico', 'Intermedio', 'Suv'];
  //String? value = 'Todos';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
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
                  child: Text('Todos'),
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
                    print('Todos');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Inicio(),
                      ),
                    );
                    break;
                  case _MenuValue.Economico:
                    print('Economico');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Inicio(),
                      ),
                    );
                    break;
                  case _MenuValue.Intermedio:
                    print('Intermedio');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Inicio(),
                      ),
                    );
                    break;
                  case _MenuValue.Suv:
                    print('Suv');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Inicio(),
                      ),
                    );
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
                onPressed: () {}, icon: Image.asset('assets/icons/user.png'))
          ],
        ),
      ),
    );
  }

  /*DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      );*/
}
