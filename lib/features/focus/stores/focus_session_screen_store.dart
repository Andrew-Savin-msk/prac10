import 'dart:async';
import 'package:mobx/mobx.dart';
import 'package:prac10/features/focus/models/focus_session_model.dart';
import 'package:prac10/features/focus/services/focus_session_service.dart';

part 'focus_session_screen_store.g.dart';

class FocusSessionScreenStore = _FocusSessionScreenStoreBase
    with _$FocusSessionScreenStore;

abstract class _FocusSessionScreenStoreBase with Store {
  _FocusSessionScreenStoreBase(this._service) {
    _loadHistory();
  }

  final FocusSessionService _service;

  Timer? _timer;

  @observable
  int plannedDurationMinutes = 25; // дефолт Pomodoro

  @observable
  int remainingSeconds = 25 * 60;

  @observable
  bool isRunning = false;

  @observable
  bool isPaused = false;

  @observable
  DateTime? currentStartTime;

  @observable
  ObservableList<FocusSession> history = ObservableList.of([]);

  @computed
  String get formattedTime {
    final minutes = remainingSeconds ~/ 60;
    final seconds = remainingSeconds % 60;
    final mm = minutes.toString().padLeft(2, '0');
    final ss = seconds.toString().padLeft(2, '0');
    return '$mm:$ss';
  }

  @computed
  bool get hasHistory => history.isNotEmpty;

  @computed
  bool get canStart => !isRunning;

  @computed
  bool get canPause => isRunning && !isPaused;

  @computed
  bool get canResume => isRunning && isPaused;

  @computed
  bool get canCancel => isRunning;

  @action
  void setPlannedDurationMinutes(int value) {
    if (!isRunning) {
      plannedDurationMinutes = value;
      remainingSeconds = value * 60;
    }
  }

  @action
  void _tick() {
    if (!isRunning || isPaused) return;
    if (remainingSeconds > 0) {
      remainingSeconds--;
    } else {
      _completeSession();
    }
  }

  @action
  void startSession() {
    if (isRunning) return;

    currentStartTime = DateTime.now();
    remainingSeconds = plannedDurationMinutes * 60;
    isRunning = true;
    isPaused = false;

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) => _tick());
  }

  @action
  void pauseSession() {
    if (!isRunning) return;
    isPaused = true;
  }

  @action
  void resumeSession() {
    if (!isRunning) return;
    isPaused = false;
  }

  @action
  void cancelSession() {
    if (!isRunning || currentStartTime == null) {
      _resetState();
      return;
    }

    final endTime = DateTime.now();
    final session = FocusSession(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      startTime: currentStartTime!,
      endTime: endTime,
      plannedDurationMinutes: plannedDurationMinutes,
      completed: false,
    );

    _service.addSession(session);
    _loadHistory();
    _resetState();
  }

  @action
  void _completeSession() {
    if (currentStartTime == null) {
      _resetState();
      return;
    }

    final endTime = DateTime.now();
    final session = FocusSession(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      startTime: currentStartTime!,
      endTime: endTime,
      plannedDurationMinutes: plannedDurationMinutes,
      completed: true,
    );

    _service.addSession(session);
    _loadHistory();
    _resetState();
  }

  @action
  void clearHistory() {
    _service.clearHistory();
    _loadHistory();
  }

  @action
  void _resetState() {
    _timer?.cancel();
    _timer = null;
    isRunning = false;
    isPaused = false;
    currentStartTime = null;
    remainingSeconds = plannedDurationMinutes * 60;
  }

  @action
  void _loadHistory() {
    history = ObservableList.of(_service.sessions);
  }

  void dispose() {
    _timer?.cancel();
  }
}

