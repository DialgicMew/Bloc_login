import 'package:flutter/material.dart';
import '../blocs/bloc.dart';
import '../blocs/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Container(
      margin: EdgeInsets.all(30.0),
      child: Column(
        children: <Widget>[emailField(bloc), passwordField(bloc), submit(bloc)],
      ),
    );
  }

  Widget emailField(Bloc bloc) {
    return StreamBuilder(
        stream: bloc.email,
        builder: (context, snapshot) {
          return TextField(
            onChanged: bloc.changeEmail,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                hintText: 'abc@gmail.com',
                labelText: 'EMAIL',
                errorText: snapshot.error),
          );
        });
  }

  Widget passwordField(Bloc bloc) {
    return StreamBuilder(
        stream: bloc.password,
        builder: (context, snapshot) {
          return TextField(
            onChanged: bloc.changePassword,
            obscureText: true,
            decoration: InputDecoration(
                hintText: 'password',
                labelText: 'PASSWORD',
                errorText: snapshot.error),
          );
        });
  }

  Widget submit(Bloc bloc) {
    return StreamBuilder(
      builder: (context, snapshot) {
        return RaisedButton(
          onPressed: snapshot.hasData ? bloc.submit : null,
          child: Text('Login'),
          color: Colors.blue,
        );
      },
      stream: bloc.submitValid,
    );
  }
}
