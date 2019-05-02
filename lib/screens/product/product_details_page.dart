import 'package:flutter/material.dart';
import './widgets/card_info.dart';

class ProductDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final makeFloatingActionButton = FloatingActionButton.extended(
      backgroundColor: Colors.green,
      icon: Icon(
        Icons.add_shopping_cart,
        color: Colors.white,
      ),
      label: Text(
        'Comprar',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      onPressed: () {},
    );

    final makeAppBar = AppBar(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Color.fromRGBO(99, 46, 145, 1.0),
      title: Text(
        'Detalhes',
        style: TextStyle(color: Colors.white),
      ),
      leading: Icon(
        Icons.arrow_back,
        color: Colors.white,
      ),
    );

    return Scaffold(
      appBar: makeAppBar,
      backgroundColor: Color.fromRGBO(99, 46, 145, 1.0),
      body: new ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          CardInfo('Informações do produto', 'informações'),
          CardInfo('Quais dados eu vejo nessa consulta?', 'informações'),
        ],
      ),
      floatingActionButton: makeFloatingActionButton,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
