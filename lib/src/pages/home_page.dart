import 'package:flutter/material.dart';
import 'package:mat_peli_app/src/providers/peliculas_provider.dart';
import 'package:mat_peli_app/src/widgets/card_swiper_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Peliculas en cines',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              color: Colors.black,
              onPressed: () {},
            )
          ],
        ),
        body: Container(
          child: Column(
            children: [_swiperTarjetas()],
          ),
        ));

    /* Scaffold(
      appBar: AppBar(
        title: Text("MatPeliApp"),
      ),
      body: Center(
        child: Text("Nuevo Texto"),
      ),
    ); */
  }

  Widget _swiperTarjetas() {
    final peliculasProvider = new PeliculasProvider();
    peliculasProvider.getEnCines();
    return CardSwiper(
      peliculas: [1, 2, 3, 4, 5],
    );
  }
}
