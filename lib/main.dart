import 'package:flutter/material.dart';
import 'package:mat_peli_app/src/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Películas',
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      routes: getApplicationRoutes(),
    );
  }
}
