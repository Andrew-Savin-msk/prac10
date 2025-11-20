import 'package:get_it/get_it.dart';
import 'package:prac10/features/support/models/faq_item_model.dart';
import 'package:prac10/features/support/models/feedback_message_model.dart';
import 'package:prac10/features/activity_log/services/activity_log_service.dart';

class SupportService {
  final List<FaqItem> _faqItems = [
    FaqItem(
      id: 'goals_purpose',
      question: 'Для чего нужно это приложение?',
      answer:
          'Приложение помогает ставить цели, разбивать их на подзадачи и отслеживать прогресс.',
    ),
    FaqItem(
      id: 'account_optional',
      question: 'Нужно ли обязательно входить в аккаунт?',
      answer:
          'Нет, вы можете пользоваться приложением и без аккаунта. Аккаунт нужен для персонализации и синхронизации (в будущем).',
    ),
    FaqItem(
      id: 'focus_sessions',
      question: 'Что такое фокус-сессии?',
      answer:
          'Это таймер, который помогает концентрироваться на задачах в течение ограниченного времени (например, 25 минут).',
    ),
    FaqItem(
      id: 'achievements',
      question: 'Как открываются ачивки?',
      answer:
          'Ачивки открываются автоматически при выполнении определённых действий: создание целей, их завершение, достижение прогресса и т.д.',
    ),
    FaqItem(
      id: 'activity_log',
      question: 'Что такое журнал действий?',
      answer:
          'Журнал действий показывает историю вашей активности в приложении: создание целей, вход в аккаунт, открытие статей и другие события.',
    ),
  ];

  final List<FeedbackMessage> _feedbackMessages = [];

  ActivityLogService get _logService => GetIt.I<ActivityLogService>();

  List<FaqItem> getFaqItems() {
    return List.unmodifiable(_faqItems);
  }

  List<FeedbackMessage> getFeedbackMessages() {
    return List.unmodifiable(_feedbackMessages);
  }

  void sendFeedback({
    required String subject,
    required String message,
    String? contact,
  }) {
    final feedback = FeedbackMessage(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      subject: subject,
      message: message,
      contact: contact,
      createdAt: DateTime.now(),
    );

    _feedbackMessages.insert(0, feedback);

    // логирование в журнал действий
    _logService.log(
      type: 'feedback_sent',
      title: 'Отправлен отзыв',
      description: subject.isNotEmpty ? subject : null,
    );
  }
}

