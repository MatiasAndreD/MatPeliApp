import 'package:flutter/material.dart';
import 'package:mat_peli_app/src/pages/home_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  final rutas = <String, WidgetBuilder>{
    '/': (BuildContext context) => HomePage(),
  };

  return rutas;
}
