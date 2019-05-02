import 'package:flutter/material.dart';

class CardInfo extends StatelessWidget {
  final String title;
  final String info;

  CardInfo(this.title, this.info);

  @override
  Widget build(BuildContext context) {
    final cardInfo = new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Center(
          child: new Text(
            title,
            style: TextStyle(
              color: Color.fromRGBO(99, 46, 145, 1.0),
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        new Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: new Text(
            info,
            style: TextStyle(
              color: Color.fromRGBO(99, 46, 145, 1.0),
              fontSize: 18,
            ),
          ),
        ),
      ],
    );

    return new Padding(
      padding: const EdgeInsets.all(24.0),
      child: Container(
        height: 500,
        width: 365,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            new BoxShadow(
              color: Colors.black26,
              blurRadius: 8,
              spreadRadius: 1,
            )
          ],
        ),
        child: cardInfo,
      ),
    );
  }
}
