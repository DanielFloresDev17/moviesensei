import 'package:dio/dio.dart';
import 'package:moviesensei/config/constants/environment.dart';
import 'package:moviesensei/domain/datasources/movies_datasource.dart';
import 'package:moviesensei/domain/entities/movie.dart';
import 'package:moviesensei/infrastructure/mappers/movie_mapper.dart';
import 'package:moviesensei/infrastructure/models/moviedb/moviedb_response.dart';

class MoviedbDatasource extends MoviesDatasource {
  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3',
    queryParameters: {
      'api_key': Environment.theMovieDbKey,
      'language': 'es-MX'
    }
  ));
  
  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    
    final response = await dio.get('/movie/now_playing');
    
    final movieDbResponse = MovieDbResponse.fromJson(response.data);

    final List<Movie> movies = movieDbResponse.results
    .where((moviedb) => moviedb.posterPath != 'no-poster') //Podemos hacerlo también con backdropPath
    .map(
      (moviedb) => MovieMapper.movieDBToEntity(moviedb)
    ).toList();
    
    return movies;

  }

}