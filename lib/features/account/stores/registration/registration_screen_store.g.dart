// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RegistrationScreenStore on _RegistrationScreenStore, Store {
  Computed<bool>? _$canRegisterComputed;

  @override
  bool get canRegister => (_$canRegisterComputed ??= Computed<bool>(
    () => super.canRegister,
    name: '_RegistrationScreenStore.canRegister',
  )).value;

  late final _$nameAtom = Atom(
    name: '_RegistrationScreenStore.name',
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
    name: '_RegistrationScreenStore.email',
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

  late final _$passwordAtom = Atom(
    name: '_RegistrationScreenStore.password',
    context: context,
  );

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$confirmPasswordAtom = Atom(
    name: '_RegistrationScreenStore.confirmPassword',
    context: context,
  );

  @override
  String get confirmPassword {
    _$confirmPasswordAtom.reportRead();
    return super.confirmPassword;
  }

  @override
  set confirmPassword(String value) {
    _$confirmPasswordAtom.reportWrite(value, super.confirmPassword, () {
      super.confirmPassword = value;
    });
  }

  late final _$errorMessageAtom = Atom(
    name: '_RegistrationScreenStore.errorMessage',
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

  late final _$registerAsyncAction = AsyncAction(
    '_RegistrationScreenStore.register',
    context: context,
  );

  @override
  Future<bool> register() {
    return _$registerAsyncAction.run(() => super.register());
  }

  late final _$_RegistrationScreenStoreActionController = ActionController(
    name: '_RegistrationScreenStore',
    context: context,
  );

  @override
  void setName(String value) {
    final _$actionInfo = _$_RegistrationScreenStoreActionController.startAction(
      name: '_RegistrationScreenStore.setName',
    );
    try {
      return super.setName(value);
    } finally {
      _$_RegistrationScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_RegistrationScreenStoreActionController.startAction(
      name: '_RegistrationScreenStore.setEmail',
    );
    try {
      return super.setEmail(value);
    } finally {
      _$_RegistrationScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_RegistrationScreenStoreActionController.startAction(
      name: '_RegistrationScreenStore.setPassword',
    );
    try {
      return super.setPassword(value);
    } finally {
      _$_RegistrationScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setConfirmPassword(String value) {
    final _$actionInfo = _$_RegistrationScreenStoreActionController.startAction(
      name: '_RegistrationScreenStore.setConfirmPassword',
    );
    try {
      return super.setConfirmPassword(value);
    } finally {
      _$_RegistrationScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearError() {
    final _$actionInfo = _$_RegistrationScreenStoreActionController.startAction(
      name: '_RegistrationScreenStore.clearError',
    );
    try {
      return super.clearError();
    } finally {
      _$_RegistrationScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
email: ${email},
password: ${password},
confirmPassword: ${confirmPassword},
errorMessage: ${errorMessage},
canRegister: ${canRegister}
    ''';
  }
}
