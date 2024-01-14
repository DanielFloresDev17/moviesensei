



import 'package:moviesensei/domain/entities/entities.dart';
import 'package:moviesensei/infrastructure/models/moviedb/moviedb_videos.dart';

class VideoMapper {

  static moviedbVideoToEntity( Result moviedbVideo ) => Video(
    id: moviedbVideo.id, 
    name: moviedbVideo.name, 
    youtubeKey: moviedbVideo.key,
    publishedAt: moviedbVideo.publishedAt
  );


}