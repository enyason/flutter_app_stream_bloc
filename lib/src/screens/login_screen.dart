import 'package:flutter/material.dart';
import '../bloc/bloc.dart';

class LogInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          emailField(),
          passField(),
          Container(
            margin: EdgeInsets.only(top: 25.0),
          ),
          submitButton()
        ],
      ),
    );
  }

  Widget emailField() {
    return StreamBuilder(
      stream: bloc.emailStream(),
      builder: (context, snapshot) {
        return TextField(
          onChanged: (val) {
            bloc.emailController.sink.add(val);
          },
          keyboardType: TextInputType.emailAddress,
          decoration:
              InputDecoration(errorText: snapshot.error, labelText: "Email"),
        );
      },
    );
  }

  Widget passField() {
    return StreamBuilder(
      stream: bloc.passStream(),
      builder: (context, snapshot) {
        return TextField(
          onChanged: (val) {
            bloc.passController.sink.add(val);
          },
          decoration:
              InputDecoration(errorText: snapshot.error, labelText: "password"),
        );
      },
    );
  }

  Widget submitButton() {
    return StreamBuilder(
      stream: bloc.submitStream(),
      builder: (context, snapshot) {
        return RaisedButton(
          onPressed: snapshot.hasData ? () {} : null,
          child: Text("Log in"),
        );
      },
    );
  }
}
