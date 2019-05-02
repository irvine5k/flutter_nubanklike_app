import 'package:flutter/material.dart';
import '../../product/product_details_page.dart';

class CardHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: 22.0, left: 22.0, right: 22.0, bottom: 22.0),
      child: Container(
        constraints: BoxConstraints(
          minWidth: MediaQuery.of(context).size.width * 0.9,
          maxWidth: MediaQuery.of(context).size.width * 0.9,
          maxHeight: MediaQuery.of(context).size.height * 0.6,
          minHeight: MediaQuery.of(context).size.height * 0.6,
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              new BoxShadow(color: Colors.grey, blurRadius: 8, spreadRadius: 1)
            ]),
        child: Column(
          children: <Widget>[
            new Center(
              heightFactor: 4,
              child: Text(
                'Produto A',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            new Center(
              heightFactor: 1,
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAa',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: MediaQuery.of(context).size.width * 0.05,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  new Center(
                    child: new Text(
                      'R\$ 0.00',
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: MediaQuery.of(context).size.width * 0.07,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 30.0,
                        width: 130,
                        child: Material(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.green,
                          elevation: 0,
                          child: GestureDetector(
                            onTap: () {},
                            child: Center(
                              child: Text(
                                'Comprar',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 30.0,
                        width: 130,
                        child: Material(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey[400],
                          elevation: 0,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      ProductDetails()));
                            },
                            child: Center(
                              child: Text(
                                'Detalhes',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
