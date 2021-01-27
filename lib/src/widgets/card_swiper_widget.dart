import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:mat_peli_app/src/models/pelicula_model.dart';

class CardSwiper extends StatelessWidget {
  final List<Pelicula> peliculas;

  CardSwiper({@required this.peliculas});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Container(
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return ClipRRect(
            child: FadeInImage(
              image: NetworkImage(peliculas[index].getPosterReturn()),
              placeholder: AssetImage('assets/loading.gif'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(30.0),
          );
        },
        itemWidth: _screenSize.width * 0.5,
        itemHeight: _screenSize.height * 0.4,
        itemCount: peliculas.length,
        layout: SwiperLayout.STACK,
        onTap: null,
      ),
    );
  }
}
