
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviesensei/domain/entities/movie.dart';
import 'package:moviesensei/domain/repositories/local_storage_repository.dart';
import 'package:moviesensei/presentation/providers/storage/local_storage_provider.dart';




final favoriteMoviesProvider = StateNotifierProvider<StorageMoviesNotifier, Map<int, Movie>>((ref) {

  final localStorageRepository = ref.watch(localStorageRepositoryProvider);

  return StorageMoviesNotifier(localStorageRepository: localStorageRepository);
});

/*
  {
    1707: Movie,
    6512: Movie,
    1206: Movie
  }
*/

class StorageMoviesNotifier extends StateNotifier<Map<int, Movie>> {
  
  int page = 0;

  final LocalStorageRepository localStorageRepository;
  
  StorageMoviesNotifier({
    required this.localStorageRepository
  }): super({});

  Future<List<Movie>> loadNextPage() async {
    final movies = await localStorageRepository.loadMovies(offset: page * 10, limit: 20);
    page++;

    final tempMovieMap = <int, Movie>{};
    for ( final movie in movies ){
      tempMovieMap[movie.id] = movie;
    }

    state = {...state, ...tempMovieMap};

    return movies;
  }

  Future<void> toggleFavorite(Movie movie) async {
    await localStorageRepository.toggleFavorite(movie);
    final bool isMovieInFavorites = state[movie.id] != null;

    if(isMovieInFavorites){
      state.remove(movie.id);
      state = {...state};
    }else{
      state = {...state, movie.id: movie};
    }
  }


}