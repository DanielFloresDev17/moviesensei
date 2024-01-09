


import 'package:moviesensei/domain/entities/actor.dart';

abstract class ActorsDatasource {

  Future<List<Actor>> getActorsByMovie(String movieId);
}