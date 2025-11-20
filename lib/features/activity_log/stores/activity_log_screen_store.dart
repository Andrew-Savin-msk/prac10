import 'package:mobx/mobx.dart';
import 'package:prac10/features/activity_log/models/log_entry_model.dart';
import 'package:prac10/features/activity_log/services/activity_log_service.dart';

part 'activity_log_screen_store.g.dart';

class ActivityLogScreenStore = _ActivityLogScreenStoreBase
    with _$ActivityLogScreenStore;

abstract class _ActivityLogScreenStoreBase with Store {
  _ActivityLogScreenStoreBase(this._service) {
    refresh();
  }

  final ActivityLogService _service;

  @observable
  ObservableList<LogEntry> entries = ObservableList.of([]);

  @computed
  bool get hasEntries => entries.isNotEmpty;

  @action
  void refresh() {
    entries = ObservableList.of(_service.entries);
  }

  @action
  void clear() {
    _service.clear();
    refresh();
  }
}

