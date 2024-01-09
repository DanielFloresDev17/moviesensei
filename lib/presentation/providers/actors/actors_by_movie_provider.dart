import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviesensei/domain/entities/actor.dart';
import 'package:moviesensei/presentation/providers/actors/actors_repository_provider.dart';



final actorsByMovieProvider = StateNotifierProvider<ActorsByMovieNotifier, Map<String, List<Actor>>>((ref) {

  final actorsRepository = ref.watch(actorsRepositoryProvider);

  return ActorsByMovieNotifier(getActors: actorsRepository.getActorsByMovie);
});


/*
  {
    '505152': <Actor>[],
    '505153': <Actor>[],
    '505171': <Actor>[],
    '505122': <Actor>[],
  }
*/

typedef GetActorsCallback = Future<List<Actor>>Function(String movieId);


class ActorsByMovieNotifier extends StateNotifier<Map<String,List<Actor>>> {
  
  final GetActorsCallback getActors;
  
  ActorsByMovieNotifier({
    required this.getActors,
  }): super({});

  Future<void> loadActors(String movieId) async {
    if(state[movieId] != null) return;

    final List<Actor> actors = await getActors(movieId);

    state = {...state , movieId: actors};
  }
}