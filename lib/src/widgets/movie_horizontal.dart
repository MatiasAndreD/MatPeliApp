import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:mat_peli_app/src/models/pelicula_model.dart';

class MovienHorizontal extends StatelessWidget {
  final List<Pelicula> peliculas;
  final Function siguientePagina;

  MovienHorizontal({@required this.peliculas, @required this.siguientePagina});

  final _pageController =
      new PageController(initialPage: 1, viewportFraction: 0.3);

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    _pageController.addListener(() {
      if (_pageController.position.pixels >=
          _pageController.position.maxScrollExtent - 200) {
        siguientePagina();
      }
    });

    return Container(
        height: _screenSize.height * 0.27,
        child: PageView.builder(
            controller: _pageController,
            /* children: _tarjetas(context), */
            itemCount: peliculas.length,
            itemBuilder: (context, i) => _tarjeta(peliculas[i], context)));
  }

  Widget _tarjeta(Pelicula pelicula, BuildContext context) {
    pelicula.uid = UniqueKey().toString();

    final peliculaTarjeta = Container(
      margin: EdgeInsets.only(right: 15.0),
      child: Column(
        children: [
          Hero(
            tag: pelicula.uid,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: FadeInImage(
                image: NetworkImage(pelicula.getPosterReturn()),
                placeholder: AssetImage('assets/loading.gif'),
                fit: BoxFit.cover,
                height: 160.0,
              ),
            ),
          ),
          SizedBox(height: 5.0),
          Text(
            pelicula.title,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.caption,
          )
        ],
      ),
    );

    return GestureDetector(
      child: peliculaTarjeta,
      onTap: () {
        timeDilation = 1.5;
        Navigator.pushNamed(context, 'details', arguments: pelicula);
      },
    );
  }
}
