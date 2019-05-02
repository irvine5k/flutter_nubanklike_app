import 'dart:async';

import '../home/bloc/bloc_drag_down.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  final bool animated;
  final bool scroll;

  MenuPage({this.animated, this.scroll});

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  bool anime = true;
  void animation() {
    Timer(Duration(milliseconds: 10), () {
      setState(() {
        anime = !anime;
      });
    });
  }

  @override
  void initState() {
    animation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: positionUpdated.stream,
      builder: (context, snaphot) {
        return AnimatedContainer(
          duration: Duration(milliseconds: widget.scroll ? 1 : 500),
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          height: widget.scroll
              ? snaphot.data * MediaQuery.of(context).size.height
              : widget.animated == false
                  ? anime ? 0.0 : MediaQuery.of(context).size.height
                  : anime ? MediaQuery.of(context).size.height : 0.0,
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: ListTile(
                  isThreeLine: false,
                  title: Text(
                    "Perfil",
                    style: TextStyle(color: Color.fromRGBO(99, 46, 145, 1.0)),
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                    color: Color.fromRGBO(99, 46, 145, 1.0),
                  ),
                  onTap: () {
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: ListTile(
                  isThreeLine: false,
                  title: Text(
                    "Configurações",
                    style: TextStyle(color: Color.fromRGBO(99, 46, 145, 1.0)),
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                    color: Color.fromRGBO(99, 46, 145, 1.0),
                  ),
                  onTap: () {
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: ListTile(
                  isThreeLine: false,
                  title: Text(
                    "Logar/Deslogar",
                    style: TextStyle(color: Color.fromRGBO(99, 46, 145, 1.0)),
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                    color: Color.fromRGBO(99, 46, 145, 1.0),
                  ),
                  
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
