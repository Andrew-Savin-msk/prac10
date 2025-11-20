import 'package:get_it/get_it.dart';
import '../models/focus_session_model.dart';
import 'package:prac10/features/activity_log/services/activity_log_service.dart';

class FocusSessionService {
  final List<FocusSession> _sessions = [];

  List<FocusSession> get sessions => List.unmodifiable(_sessions);

  ActivityLogService get _logService => GetIt.I<ActivityLogService>();

  void addSession(FocusSession session) {
    _sessions.insert(0, session); // новые сверху

    if (session.completed) {
      _logService.log(
        type: 'focus_completed',
        title: 'Фокус-сессия завершена',
        description:
            'Длительность: ${session.plannedDurationMinutes} минут, фактически: ${session.actualDuration.inMinutes} минут',
      );
    } else {
      _logService.log(
        type: 'focus_cancelled',
        title: 'Фокус-сессия прервана',
        description:
            'Фактическая длительность: ${session.actualDuration.inMinutes} минут',
      );
    }
  }

  void clearHistory() {
    _sessions.clear();
  }
}

