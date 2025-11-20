import 'package:get_it/get_it.dart';
import '../models/goal_model.dart';
import 'package:prac10/features/achievements/services/achievement_service.dart';
import 'package:prac10/features/activity_log/services/activity_log_service.dart';

class GoalService {
  final List<Goal> _goals = [];

  List<Goal> get goals => _goals;

  AchievementService get _achievementService => GetIt.I<AchievementService>();
  ActivityLogService get _logService => GetIt.I<ActivityLogService>();

  void addGoal(Goal goal) {
    _goals.add(goal);
    _achievementService.onGoalCreated(_goals);
    _achievementService.onGoalUpdated(_goals);
    _logService.logGoalCreated(goal.title);
  }

  void deleteGoal(int index) {
    final goalTitle = _goals[index].title;
    _goals.removeAt(index);
    _logService.logGoalDeleted(goalTitle);
  }
}
