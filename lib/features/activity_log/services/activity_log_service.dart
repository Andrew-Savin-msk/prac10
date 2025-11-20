import 'package:prac10/features/activity_log/models/log_entry_model.dart';

class ActivityLogService {
  final List<LogEntry> _entries = [];

  List<LogEntry> get entries => List.unmodifiable(_entries);

  void log({
    required String type,
    required String title,
    String? description,
    DateTime? timestamp,
  }) {
    final entry = LogEntry(
      timestamp: timestamp ?? DateTime.now(),
      type: type,
      title: title,
      description: description,
    );
    // новые записи сверху
    _entries.insert(0, entry);
  }

  void clear() {
    _entries.clear();
  }

  // Удобные методы для разных фич:

  void logGoalCreated(String goalTitle) {
    log(
      type: 'goal_created',
      title: 'Создана цель',
      description: 'Цель: "$goalTitle"',
    );
  }

  void logGoalDeleted(String goalTitle) {
    log(
      type: 'goal_deleted',
      title: 'Удалена цель',
      description: 'Цель: "$goalTitle"',
    );
  }

  void logGoalCompleted(String goalTitle) {
    log(
      type: 'goal_completed',
      title: 'Завершена цель',
      description: 'Цель: "$goalTitle"',
    );
  }

  void logAuthLogin(String email) {
    log(
      type: 'auth_login',
      title: 'Вход в аккаунт',
      description: 'Email: $email',
    );
  }

  void logAuthLogout() {
    log(
      type: 'auth_logout',
      title: 'Выход из аккаунта',
      description: null,
    );
  }

  void logProfileUpdated(String name, String email) {
    log(
      type: 'profile_updated',
      title: 'Профиль обновлён',
      description: 'Имя: $name, Email: $email',
    );
  }

  void logAchievementUnlocked(String achievementTitle) {
    log(
      type: 'achievement_unlocked',
      title: 'Открыта ачивка',
      description: 'Ачивка: "$achievementTitle"',
    );
  }
}

