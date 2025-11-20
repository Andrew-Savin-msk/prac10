// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FeedbackScreenStore on _FeedbackScreenStoreBase, Store {
  Computed<bool>? _$canSendComputed;

  @override
  bool get canSend => (_$canSendComputed ??= Computed<bool>(
    () => super.canSend,
    name: '_FeedbackScreenStoreBase.canSend',
  )).value;

  late final _$subjectAtom = Atom(
    name: '_FeedbackScreenStoreBase.subject',
    context: context,
  );

  @override
  String get subject {
    _$subjectAtom.reportRead();
    return super.subject;
  }

  @override
  set subject(String value) {
    _$subjectAtom.reportWrite(value, super.subject, () {
      super.subject = value;
    });
  }

  late final _$messageAtom = Atom(
    name: '_FeedbackScreenStoreBase.message',
    context: context,
  );

  @override
  String get message {
    _$messageAtom.reportRead();
    return super.message;
  }

  @override
  set message(String value) {
    _$messageAtom.reportWrite(value, super.message, () {
      super.message = value;
    });
  }

  late final _$contactAtom = Atom(
    name: '_FeedbackScreenStoreBase.contact',
    context: context,
  );

  @override
  String get contact {
    _$contactAtom.reportRead();
    return super.contact;
  }

  @override
  set contact(String value) {
    _$contactAtom.reportWrite(value, super.contact, () {
      super.contact = value;
    });
  }

  late final _$errorMessageAtom = Atom(
    name: '_FeedbackScreenStoreBase.errorMessage',
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

  late final _$isSendingAtom = Atom(
    name: '_FeedbackScreenStoreBase.isSending',
    context: context,
  );

  @override
  bool get isSending {
    _$isSendingAtom.reportRead();
    return super.isSending;
  }

  @override
  set isSending(bool value) {
    _$isSendingAtom.reportWrite(value, super.isSending, () {
      super.isSending = value;
    });
  }

  late final _$isSentAtom = Atom(
    name: '_FeedbackScreenStoreBase.isSent',
    context: context,
  );

  @override
  bool get isSent {
    _$isSentAtom.reportRead();
    return super.isSent;
  }

  @override
  set isSent(bool value) {
    _$isSentAtom.reportWrite(value, super.isSent, () {
      super.isSent = value;
    });
  }

  late final _$sendAsyncAction = AsyncAction(
    '_FeedbackScreenStoreBase.send',
    context: context,
  );

  @override
  Future<void> send() {
    return _$sendAsyncAction.run(() => super.send());
  }

  late final _$_FeedbackScreenStoreBaseActionController = ActionController(
    name: '_FeedbackScreenStoreBase',
    context: context,
  );

  @override
  void setSubject(String value) {
    final _$actionInfo = _$_FeedbackScreenStoreBaseActionController.startAction(
      name: '_FeedbackScreenStoreBase.setSubject',
    );
    try {
      return super.setSubject(value);
    } finally {
      _$_FeedbackScreenStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMessage(String value) {
    final _$actionInfo = _$_FeedbackScreenStoreBaseActionController.startAction(
      name: '_FeedbackScreenStoreBase.setMessage',
    );
    try {
      return super.setMessage(value);
    } finally {
      _$_FeedbackScreenStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setContact(String value) {
    final _$actionInfo = _$_FeedbackScreenStoreBaseActionController.startAction(
      name: '_FeedbackScreenStoreBase.setContact',
    );
    try {
      return super.setContact(value);
    } finally {
      _$_FeedbackScreenStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearStatus() {
    final _$actionInfo = _$_FeedbackScreenStoreBaseActionController.startAction(
      name: '_FeedbackScreenStoreBase.clearStatus',
    );
    try {
      return super.clearStatus();
    } finally {
      _$_FeedbackScreenStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
subject: ${subject},
message: ${message},
contact: ${contact},
errorMessage: ${errorMessage},
isSending: ${isSending},
isSent: ${isSent},
canSend: ${canSend}
    ''';
  }
}
