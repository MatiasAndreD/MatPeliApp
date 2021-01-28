import 'package:flutter/material.dart';
import 'package:mat_peli_app/src/pages/details_page.dart';
import 'package:mat_peli_app/src/pages/home_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  final rutas = <String, WidgetBuilder>{
    '/': (BuildContext context) => HomePage(),
    'details': (BuildContext context) => DetailsPage(),
  };

  return rutas;
}
