import 'package:get_it/get_it.dart';
import '../models/goal_model.dart';
import 'package:prac10/features/achievements/services/achievement_service.dart';

class GoalService {
  final List<Goal> _goals = [];

  List<Goal> get goals => _goals;

  AchievementService get _achievementService => GetIt.I<AchievementService>();

  void addGoal(Goal goal) {
    _goals.add(goal);
    _achievementService.onGoalCreated(_goals);
    _achievementService.onGoalUpdated(_goals);
  }

  void deleteGoal(int index) => _goals.removeAt(index);
}
