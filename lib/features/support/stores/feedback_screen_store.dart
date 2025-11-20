import 'package:mobx/mobx.dart';
import '../services/support_service.dart';

part 'feedback_screen_store.g.dart';

class FeedbackScreenStore = _FeedbackScreenStoreBase
    with _$FeedbackScreenStore;

abstract class _FeedbackScreenStoreBase with Store {
  _FeedbackScreenStoreBase(this._service);

  final SupportService _service;

  @observable
  String subject = '';

  @observable
  String message = '';

  @observable
  String contact = '';

  @observable
  String? errorMessage;

  @observable
  bool isSending = false;

  @observable
  bool isSent = false;

  @computed
  bool get canSend =>
      subject.trim().isNotEmpty && message.trim().isNotEmpty && !isSending;

  @action
  void setSubject(String value) {
    subject = value;
    errorMessage = null;
  }

  @action
  void setMessage(String value) {
    message = value;
    errorMessage = null;
  }

  @action
  void setContact(String value) {
    contact = value;
    errorMessage = null;
  }

  @action
  void clearStatus() {
    errorMessage = null;
    isSent = false;
  }

  @action
  Future<void> send() async {
    if (!canSend) return;

    isSending = true;
    errorMessage = null;

    try {
      _service.sendFeedback(
        subject: subject.trim(),
        message: message.trim(),
        contact: contact.trim().isEmpty ? null : contact.trim(),
      );
      isSent = true;
      subject = '';
      message = '';
      contact = '';
    } catch (e) {
      errorMessage = 'Не удалось отправить отзыв.';
    } finally {
      isSending = false;
    }
  }
}

