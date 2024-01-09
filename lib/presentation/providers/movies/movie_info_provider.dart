import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviesensei/domain/entities/movie.dart';
import 'package:moviesensei/presentation/providers/movies/movies_repository_provider.dart';


final movieInfoProvider = StateNotifierProvider<MovieMapNotifier, Map<String, Movie>>((ref) {

  final movieRepository = ref.watch(movieRepositoryProvider);

  return MovieMapNotifier(getMovie: movieRepository.getMovieById);
});


/*
  {
    '505152': Movie(),
    '505153': Movie(),
    '505171': Movie(),
    '505122': Movie(),
  }
*/

typedef GetMovieCallback = Future<Movie>Function(String movieId);


class MovieMapNotifier extends StateNotifier<Map<String,Movie>> {
  
  final GetMovieCallback getMovie;
  
  MovieMapNotifier({
    required this.getMovie,
  }): super({});

  Future<void> loadMovie(String movieId) async {
    if(state[movieId] != null) return;

    final movie = await getMovie(movieId);

    state = {...state , movieId: movie};
  }
}