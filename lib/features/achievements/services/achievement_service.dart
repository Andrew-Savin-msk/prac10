import 'package:get_it/get_it.dart';
import 'package:prac10/features/achievements/models/achievement_model.dart';
import 'package:prac10/features/goals/models/goal_model.dart';
import 'package:prac10/features/activity_log/services/activity_log_service.dart';

class AchievementService {
  final List<Achievement> _achievements = [
    Achievement(
      id: 'first_goal',
      title: 'Первая цель',
      description: 'Создайте свою первую цель',
      imageUrl: 'https://picsum.photos/id/237/600/400',
      isUnlocked: false,
    ),
    Achievement(
      id: 'five_goals',
      title: '5 целей',
      description: 'Создано 5 или более целей',
      imageUrl: 'https://picsum.photos/id/1025/600/400',
      isUnlocked: false,
    ),
    Achievement(
      id: 'first_completed_goal',
      title: 'Первая выполненная цель',
      description: 'Завершена хотя бы одна цель',
      imageUrl: 'https://picsum.photos/id/1011/600/400',
      isUnlocked: false,
    ),
    Achievement(
      id: 'three_completed_goals',
      title: '3 выполненные цели',
      description: 'Завершено 3 или более целей',
      imageUrl: 'https://picsum.photos/id/1003/600/400',
      isUnlocked: false,
    ),
    Achievement(
      id: 'perfect_goal',
      title: 'Идеальная цель',
      description: 'Хотя бы одна цель с полностью выполненными подзадачами',
      imageUrl: 'https://picsum.photos/id/1035/600/400',
      isUnlocked: false,
    ),
  ];

  List<Achievement> get achievements => List.unmodifiable(_achievements);

  ActivityLogService get _logService => GetIt.I<ActivityLogService>();

  void onGoalCreated(List<Goal> allGoals) {
    _unlockIf('first_goal', () => allGoals.isNotEmpty);
    _unlockIf('five_goals', () => allGoals.length >= 5);
  }

  void onGoalUpdated(List<Goal> allGoals) {
    final hasPerfectGoal = allGoals.any((g) => g.progress >= 100);
    _unlockIf('perfect_goal', () => hasPerfectGoal);
  }

  void onGoalCompleted(List<Goal> allGoals) {
    final completedCount = allGoals.where((g) => g.isCompleted).length;
    _unlockIf('first_completed_goal', () => completedCount >= 1);
    _unlockIf('three_completed_goals', () => completedCount >= 3);
  }

  void _unlockIf(String id, bool Function() condition) {
    try {
      final achievement = _achievements.firstWhere(
        (a) => a.id == id,
      );
      if (!achievement.isUnlocked && condition()) {
        achievement.isUnlocked = true;
        _logService.logAchievementUnlocked(achievement.title);
      }
    } catch (e) {
    }
  }
}

