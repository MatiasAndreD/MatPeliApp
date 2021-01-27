class Peliculas {
  List<Pelicula> items = new List();

  Peliculas();

  Peliculas.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (var item in jsonList) {
      final pelicula = new Pelicula.fromJsonMap(item);
      items.add(pelicula);
    }
  }
}

class Pelicula {
  bool adult;
  String backdropPath;
  List<int> genreIds;
  int id;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String posterPath;
  String releaseDate;
  String title;
  bool video;
  double voteAverage;
  int voteCount;

  Pelicula({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  Pelicula.fromJsonMap(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    genreIds = json['genre_ids'].cast<int>();
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'] / 1;
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'] / 1;
    voteCount = json['vote_count'];
  }

  getPosterReturn() {
    if (posterPath == null) {
      return 'https://lh3.googleusercontent.com/proxy/2dLHbLXYe2E-qQEzghSdIggW71wawvhzFd8LfDtRlrk9NO3qEG1mn3uJnlVmboqHGhwYDKx6dyF-uENhamuSoM-xyzurOERYdWxGqzX0-7uwMpR53MJ8D64gKzv_SxNhCtTdu1RxWjCWf6hZKJwRZj-Gm8HOt4jx7XIHGpjPw_RaVt0PBTEfLneLApanaabVjEzUlZBU8sT4szTnDye7HH80dPS0BBIje_pFi8u8JaPAMI1pZnpumKEwR7hr5A0ofdreBVqGLOjDj3b2bhQUTQ9X1fFep-sTL6jabCMA5j9PpQ1XmGrOzftTETrybWc4zmkJGcIJGWOaKep5VfqZbd1rOo_NaObSNVrawkwp56fhJbaJhHVPreL0r-4sLzHXqWw_TigOYbSjMx6J9Up5ilcnXDRFxIcsvv39Wqd3zD4laWsG9twl9mSSO_qBV1he_e7A1T67TjLZvPRsa1kr05WHt0r2KRp2jgtbJ2Nqoz0mDQEBgOf_Lu_gGQ6hgRT3YxilwBpQNIgTyc9PSngiUo9tnNAcSd7tMyH8eSqiu_5F8wX_pcp3GXIYAWNnreC1hZuCx3M';
    }

    return 'https://image.tmdb.org/t/p/w500/$posterPath';
  }
}
