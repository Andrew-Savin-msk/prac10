import 'package:mobx/mobx.dart';
import '../../models/achievement_model.dart';
import '../../services/achievement_service.dart';

part 'achievements_screen_store.g.dart';

class AchievementsScreenStore = _AchievementsScreenStore
    with _$AchievementsScreenStore;

abstract class _AchievementsScreenStore with Store {
  _AchievementsScreenStore(this._service) {
    refresh();
  }

  final AchievementService _service;

  @observable
  ObservableList<Achievement> achievements = ObservableList<Achievement>();

  @computed
  bool get hasAchievements => achievements.isNotEmpty;

  @computed
  int get unlockedCount => achievements.where((a) => a.isUnlocked).length;

  @action
  void refresh() {
    achievements = ObservableList.of(_service.achievements);
  }
}

