// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProfileScreenStore on _ProfileScreenStore, Store {
  Computed<bool>? _$isLoggedInComputed;

  @override
  bool get isLoggedIn => (_$isLoggedInComputed ??= Computed<bool>(
    () => super.isLoggedIn,
    name: '_ProfileScreenStore.isLoggedIn',
  )).value;

  late final _$userAtom = Atom(
    name: '_ProfileScreenStore.user',
    context: context,
  );

  @override
  UserAccount? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(UserAccount? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$_ProfileScreenStoreActionController = ActionController(
    name: '_ProfileScreenStore',
    context: context,
  );

  @override
  void loadCurrentUser() {
    final _$actionInfo = _$_ProfileScreenStoreActionController.startAction(
      name: '_ProfileScreenStore.loadCurrentUser',
    );
    try {
      return super.loadCurrentUser();
    } finally {
      _$_ProfileScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user},
isLoggedIn: ${isLoggedIn}
    ''';
  }
}
