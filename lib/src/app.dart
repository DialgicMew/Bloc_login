import 'package:flutter/material.dart';
import '../screens/login.dart';
import '../blocs/provider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        title: 'Log me in',
        home: Scaffold(
          body: LoginScreen(),
        ),
      ),
    );
  }
}
