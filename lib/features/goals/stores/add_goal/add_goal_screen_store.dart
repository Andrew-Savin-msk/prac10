import 'package:mobx/mobx.dart';

import 'package:prac10/features/goals/models/goal_model.dart';
import 'package:prac10/features/goals/services/goal_service.dart';

part 'add_goal_screen_store.g.dart';

class AddGoalScreenStore = _AddGoalScreenStore with _$AddGoalScreenStore;

abstract class _AddGoalScreenStore with Store {
  _AddGoalScreenStore(this._goalService);

  final GoalService _goalService;

  @observable
  String title = '';

  @observable
  DateTime? deadline;

  @computed
  bool get canSave => title.trim().length >= 3 && deadline != null;

  @action
  void setTitle(String value) {
    title = value;
  }

  @action
  void setDeadline(DateTime value) {
    deadline = value;
  }

  @action
  void clear() {
    title = '';
    deadline = null;
  }

  @action
  void createGoal() {
    if (!canSave) return;

    final goal = Goal(
      title: title.trim(),
      deadline: deadline!,
    );

    _goalService.addGoal(goal);

    clear();
  }
}
