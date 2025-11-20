// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_log_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ActivityLogScreenStore on _ActivityLogScreenStoreBase, Store {
  Computed<bool>? _$hasEntriesComputed;

  @override
  bool get hasEntries => (_$hasEntriesComputed ??= Computed<bool>(
    () => super.hasEntries,
    name: '_ActivityLogScreenStoreBase.hasEntries',
  )).value;

  late final _$entriesAtom = Atom(
    name: '_ActivityLogScreenStoreBase.entries',
    context: context,
  );

  @override
  ObservableList<LogEntry> get entries {
    _$entriesAtom.reportRead();
    return super.entries;
  }

  @override
  set entries(ObservableList<LogEntry> value) {
    _$entriesAtom.reportWrite(value, super.entries, () {
      super.entries = value;
    });
  }

  late final _$_ActivityLogScreenStoreBaseActionController = ActionController(
    name: '_ActivityLogScreenStoreBase',
    context: context,
  );

  @override
  void refresh() {
    final _$actionInfo = _$_ActivityLogScreenStoreBaseActionController
        .startAction(name: '_ActivityLogScreenStoreBase.refresh');
    try {
      return super.refresh();
    } finally {
      _$_ActivityLogScreenStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clear() {
    final _$actionInfo = _$_ActivityLogScreenStoreBaseActionController
        .startAction(name: '_ActivityLogScreenStoreBase.clear');
    try {
      return super.clear();
    } finally {
      _$_ActivityLogScreenStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
entries: ${entries},
hasEntries: ${hasEntries}
    ''';
  }
}
