import 'package:fluttertataskyapp/Game/Tictoctoe/storage/game_info_repository.dart';
import 'package:flutter/widgets.dart';

class HomePresenter {

  GameInfoRepository repository;

  HomePresenter() {
    repository = GameInfoRepository.getInstance();
  }

  Stream buildVictoriesStream() {
    return repository.getVictoryStream();
  }

  /// Gets a victory count from a stream snapshot.
  int getVictoryCountFromStream(AsyncSnapshot snapshot) {
    return repository.getVictoryCount(snapshot);
  }

}