import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          emailField(),
          passwordField(),
          Container(margin: EdgeInsets.only(top: 25.0)),
          submitButton(),
        ],
      ),
    );
  }

  Widget emailField() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration:
          InputDecoration(hintText: 'seunome@example.com', labelText: 'Email'),
    );
  }

  Widget passwordField() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(hintText: 'senha', labelText: 'Senha'),
    );
  }

  Widget submitButton() {
    return Container(
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
              'Entrar',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
