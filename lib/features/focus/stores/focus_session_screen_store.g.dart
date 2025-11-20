// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'focus_session_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FocusSessionScreenStore on _FocusSessionScreenStoreBase, Store {
  Computed<String>? _$formattedTimeComputed;

  @override
  String get formattedTime => (_$formattedTimeComputed ??= Computed<String>(
    () => super.formattedTime,
    name: '_FocusSessionScreenStoreBase.formattedTime',
  )).value;
  Computed<bool>? _$hasHistoryComputed;

  @override
  bool get hasHistory => (_$hasHistoryComputed ??= Computed<bool>(
    () => super.hasHistory,
    name: '_FocusSessionScreenStoreBase.hasHistory',
  )).value;
  Computed<bool>? _$canStartComputed;

  @override
  bool get canStart => (_$canStartComputed ??= Computed<bool>(
    () => super.canStart,
    name: '_FocusSessionScreenStoreBase.canStart',
  )).value;
  Computed<bool>? _$canPauseComputed;

  @override
  bool get canPause => (_$canPauseComputed ??= Computed<bool>(
    () => super.canPause,
    name: '_FocusSessionScreenStoreBase.canPause',
  )).value;
  Computed<bool>? _$canResumeComputed;

  @override
  bool get canResume => (_$canResumeComputed ??= Computed<bool>(
    () => super.canResume,
    name: '_FocusSessionScreenStoreBase.canResume',
  )).value;
  Computed<bool>? _$canCancelComputed;

  @override
  bool get canCancel => (_$canCancelComputed ??= Computed<bool>(
    () => super.canCancel,
    name: '_FocusSessionScreenStoreBase.canCancel',
  )).value;

  late final _$plannedDurationMinutesAtom = Atom(
    name: '_FocusSessionScreenStoreBase.plannedDurationMinutes',
    context: context,
  );

  @override
  int get plannedDurationMinutes {
    _$plannedDurationMinutesAtom.reportRead();
    return super.plannedDurationMinutes;
  }

  @override
  set plannedDurationMinutes(int value) {
    _$plannedDurationMinutesAtom.reportWrite(
      value,
      super.plannedDurationMinutes,
      () {
        super.plannedDurationMinutes = value;
      },
    );
  }

  late final _$remainingSecondsAtom = Atom(
    name: '_FocusSessionScreenStoreBase.remainingSeconds',
    context: context,
  );

  @override
  int get remainingSeconds {
    _$remainingSecondsAtom.reportRead();
    return super.remainingSeconds;
  }

  @override
  set remainingSeconds(int value) {
    _$remainingSecondsAtom.reportWrite(value, super.remainingSeconds, () {
      super.remainingSeconds = value;
    });
  }

  late final _$isRunningAtom = Atom(
    name: '_FocusSessionScreenStoreBase.isRunning',
    context: context,
  );

  @override
  bool get isRunning {
    _$isRunningAtom.reportRead();
    return super.isRunning;
  }

  @override
  set isRunning(bool value) {
    _$isRunningAtom.reportWrite(value, super.isRunning, () {
      super.isRunning = value;
    });
  }

  late final _$isPausedAtom = Atom(
    name: '_FocusSessionScreenStoreBase.isPaused',
    context: context,
  );

  @override
  bool get isPaused {
    _$isPausedAtom.reportRead();
    return super.isPaused;
  }

  @override
  set isPaused(bool value) {
    _$isPausedAtom.reportWrite(value, super.isPaused, () {
      super.isPaused = value;
    });
  }

  late final _$currentStartTimeAtom = Atom(
    name: '_FocusSessionScreenStoreBase.currentStartTime',
    context: context,
  );

  @override
  DateTime? get currentStartTime {
    _$currentStartTimeAtom.reportRead();
    return super.currentStartTime;
  }

  @override
  set currentStartTime(DateTime? value) {
    _$currentStartTimeAtom.reportWrite(value, super.currentStartTime, () {
      super.currentStartTime = value;
    });
  }

  late final _$historyAtom = Atom(
    name: '_FocusSessionScreenStoreBase.history',
    context: context,
  );

  @override
  ObservableList<FocusSession> get history {
    _$historyAtom.reportRead();
    return super.history;
  }

  @override
  set history(ObservableList<FocusSession> value) {
    _$historyAtom.reportWrite(value, super.history, () {
      super.history = value;
    });
  }

  late final _$_FocusSessionScreenStoreBaseActionController = ActionController(
    name: '_FocusSessionScreenStoreBase',
    context: context,
  );

  @override
  void setPlannedDurationMinutes(int value) {
    final _$actionInfo = _$_FocusSessionScreenStoreBaseActionController
        .startAction(
          name: '_FocusSessionScreenStoreBase.setPlannedDurationMinutes',
        );
    try {
      return super.setPlannedDurationMinutes(value);
    } finally {
      _$_FocusSessionScreenStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _tick() {
    final _$actionInfo = _$_FocusSessionScreenStoreBaseActionController
        .startAction(name: '_FocusSessionScreenStoreBase._tick');
    try {
      return super._tick();
    } finally {
      _$_FocusSessionScreenStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void startSession() {
    final _$actionInfo = _$_FocusSessionScreenStoreBaseActionController
        .startAction(name: '_FocusSessionScreenStoreBase.startSession');
    try {
      return super.startSession();
    } finally {
      _$_FocusSessionScreenStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void pauseSession() {
    final _$actionInfo = _$_FocusSessionScreenStoreBaseActionController
        .startAction(name: '_FocusSessionScreenStoreBase.pauseSession');
    try {
      return super.pauseSession();
    } finally {
      _$_FocusSessionScreenStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resumeSession() {
    final _$actionInfo = _$_FocusSessionScreenStoreBaseActionController
        .startAction(name: '_FocusSessionScreenStoreBase.resumeSession');
    try {
      return super.resumeSession();
    } finally {
      _$_FocusSessionScreenStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void cancelSession() {
    final _$actionInfo = _$_FocusSessionScreenStoreBaseActionController
        .startAction(name: '_FocusSessionScreenStoreBase.cancelSession');
    try {
      return super.cancelSession();
    } finally {
      _$_FocusSessionScreenStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _completeSession() {
    final _$actionInfo = _$_FocusSessionScreenStoreBaseActionController
        .startAction(name: '_FocusSessionScreenStoreBase._completeSession');
    try {
      return super._completeSession();
    } finally {
      _$_FocusSessionScreenStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearHistory() {
    final _$actionInfo = _$_FocusSessionScreenStoreBaseActionController
        .startAction(name: '_FocusSessionScreenStoreBase.clearHistory');
    try {
      return super.clearHistory();
    } finally {
      _$_FocusSessionScreenStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _resetState() {
    final _$actionInfo = _$_FocusSessionScreenStoreBaseActionController
        .startAction(name: '_FocusSessionScreenStoreBase._resetState');
    try {
      return super._resetState();
    } finally {
      _$_FocusSessionScreenStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _loadHistory() {
    final _$actionInfo = _$_FocusSessionScreenStoreBaseActionController
        .startAction(name: '_FocusSessionScreenStoreBase._loadHistory');
    try {
      return super._loadHistory();
    } finally {
      _$_FocusSessionScreenStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
plannedDurationMinutes: ${plannedDurationMinutes},
remainingSeconds: ${remainingSeconds},
isRunning: ${isRunning},
isPaused: ${isPaused},
currentStartTime: ${currentStartTime},
history: ${history},
formattedTime: ${formattedTime},
hasHistory: ${hasHistory},
canStart: ${canStart},
canPause: ${canPause},
canResume: ${canResume},
canCancel: ${canCancel}
    ''';
  }
}
