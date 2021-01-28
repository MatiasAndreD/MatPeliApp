import 'package:flutter/material.dart';
import 'package:mat_peli_app/src/models/pelicula_model.dart';
import 'package:mat_peli_app/src/providers/peliculas_provider.dart';

class PeliculaSearch extends SearchDelegate {
  @override
  String get searchFieldLabel => 'Buscar pelicula';
  String seleccion = '';
  final peliculasProvider = new PeliculasProvider();
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: Acciones de nuestro AppBar
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: Icono a la izquierda del Appbar
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: Crea los resultados que vamos a mostrar
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: Son las sugerencias que aparecen cuando la persona escribe.
    if (query.isEmpty) {
      return Container();
    }

    return FutureBuilder(
      future: peliculasProvider.buscarPelicula(query),
      builder: (BuildContext context, AsyncSnapshot<List<Pelicula>> snapshot) {
        if (snapshot.hasData) {
          final peliculas = snapshot.data;

          return ListView(
            children: peliculas.map((pelicula) {
              return ListTile(
                leading: FadeInImage(
                  image: NetworkImage(pelicula.getPosterReturn()),
                  placeholder: AssetImage('assets/loading.gif'),
                  width: 50.0,
                  fit: BoxFit.contain,
                ),
                title: Text(pelicula.title),
                subtitle: Text(pelicula.originalTitle),
                onTap: () {
                  pelicula.uid = '';
                  close(context, null);
                  Navigator.pushNamed(context, 'details', arguments: pelicula);
                },
              );
            }).toList(),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
