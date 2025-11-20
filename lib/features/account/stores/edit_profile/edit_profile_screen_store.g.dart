// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_profile_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EditProfileScreenStore on _EditProfileScreenStore, Store {
  Computed<bool>? _$canSaveComputed;

  @override
  bool get canSave => (_$canSaveComputed ??= Computed<bool>(
    () => super.canSave,
    name: '_EditProfileScreenStore.canSave',
  )).value;

  late final _$nameAtom = Atom(
    name: '_EditProfileScreenStore.name',
    context: context,
  );

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$emailAtom = Atom(
    name: '_EditProfileScreenStore.email',
    context: context,
  );

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$avatarUrlAtom = Atom(
    name: '_EditProfileScreenStore.avatarUrl',
    context: context,
  );

  @override
  String? get avatarUrl {
    _$avatarUrlAtom.reportRead();
    return super.avatarUrl;
  }

  @override
  set avatarUrl(String? value) {
    _$avatarUrlAtom.reportWrite(value, super.avatarUrl, () {
      super.avatarUrl = value;
    });
  }

  late final _$errorMessageAtom = Atom(
    name: '_EditProfileScreenStore.errorMessage',
    context: context,
  );

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$saveAsyncAction = AsyncAction(
    '_EditProfileScreenStore.save',
    context: context,
  );

  @override
  Future<bool> save() {
    return _$saveAsyncAction.run(() => super.save());
  }

  late final _$_EditProfileScreenStoreActionController = ActionController(
    name: '_EditProfileScreenStore',
    context: context,
  );

  @override
  void setName(String value) {
    final _$actionInfo = _$_EditProfileScreenStoreActionController.startAction(
      name: '_EditProfileScreenStore.setName',
    );
    try {
      return super.setName(value);
    } finally {
      _$_EditProfileScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_EditProfileScreenStoreActionController.startAction(
      name: '_EditProfileScreenStore.setEmail',
    );
    try {
      return super.setEmail(value);
    } finally {
      _$_EditProfileScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAvatarUrl(String? value) {
    final _$actionInfo = _$_EditProfileScreenStoreActionController.startAction(
      name: '_EditProfileScreenStore.setAvatarUrl',
    );
    try {
      return super.setAvatarUrl(value);
    } finally {
      _$_EditProfileScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearError() {
    final _$actionInfo = _$_EditProfileScreenStoreActionController.startAction(
      name: '_EditProfileScreenStore.clearError',
    );
    try {
      return super.clearError();
    } finally {
      _$_EditProfileScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
email: ${email},
avatarUrl: ${avatarUrl},
errorMessage: ${errorMessage},
canSave: ${canSave}
    ''';
  }
}
