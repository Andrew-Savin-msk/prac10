import 'package:mobx/mobx.dart';

import 'package:prac10/features/goals/models/goal_model.dart';
import 'package:prac10/features/goals/services/goal_service.dart';
import 'package:prac10/features/achievements/services/achievement_service.dart';
import 'package:prac10/features/activity_log/services/activity_log_service.dart';

part 'goal_detail_screen_store.g.dart';

class GoalDetailScreenStore = _GoalDetailScreenStore
    with _$GoalDetailScreenStore;

abstract class _GoalDetailScreenStore with Store {
  _GoalDetailScreenStore(
    this._goalService,
    this._achievementService,
    this._logService,
  );

  final GoalService _goalService;
  final AchievementService _achievementService;
  final ActivityLogService _logService;

  @observable
  Goal? currentGoal;

  @observable
  ObservableList<Subtask> subtasks = ObservableList<Subtask>();


  @computed
  double get progress {
    if (subtasks.isEmpty) return 0;
    final done = subtasks.where((s) => s.done).length;
    return (done / subtasks.length) * 100;
  }

  @action
  void attachGoal(Goal goal) {
    currentGoal = goal;
    subtasks = ObservableList<Subtask>.of(goal.subtasks);
  }

  @action
  void addSubtask(String title) {
    final text = title.trim();
    if (text.isEmpty) return;

    subtasks.add(Subtask(title: text));
    _syncBackToGoal();
  }

  @action
  void toggleSubtask(int index, bool done) {
    if (index < 0 || index >= subtasks.length) return;

    final goal = currentGoal;
    if (goal == null) return;

    final wasCompleted = goal.isCompleted;

    final old = subtasks[index];
    final updated = Subtask(title: old.title, done: done);

    subtasks[index] = updated;

    _syncBackToGoal();

    final nowCompleted = goal.isCompleted;

    // Проверяем, перешла ли цель в состояние "выполнена"
    if (!wasCompleted && nowCompleted) {
      _achievementService.onGoalCompleted(_goalService.goals);
      _logService.logGoalCompleted(goal.title);
    }

    // Обновляем ачивки при любом изменении прогресса
    _achievementService.onGoalUpdated(_goalService.goals);
  }

  void _syncBackToGoal() {
    final goal = currentGoal;
    if (goal == null) return;

    goal.subtasks = subtasks.toList();
  }
}
