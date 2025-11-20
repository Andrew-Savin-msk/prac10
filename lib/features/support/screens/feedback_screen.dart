import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:prac10/features/support/stores/feedback_screen_store.dart';
import 'package:prac10/features/support/services/support_service.dart';

class FeedbackScreen extends StatelessWidget {
  FeedbackScreen({super.key})
      : store = FeedbackScreenStore(GetIt.I<SupportService>());

  final FeedbackScreenStore store;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Обратная связь'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Observer(
          builder: (_) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (store.errorMessage != null) ...[
                    Text(
                      store.errorMessage!,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.error,
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                  if (store.isSent) ...[
                    Text(
                      'Спасибо! Ваш отзыв отправлен.',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Тема',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: store.setSubject,
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Сообщение',
                      border: OutlineInputBorder(),
                    ),
                    maxLines: 5,
                    onChanged: store.setMessage,
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Контакт (email или другая связь, опционально)',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    onChanged: store.setContact,
                  ),
                  const SizedBox(height: 24),
                  FilledButton(
                    onPressed: store.canSend
                        ? () async {
                            await store.send();
                            if (store.isSent && context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Отзыв отправлен'),
                                ),
                              );
                            }
                          }
                        : null,
                    style: FilledButton.styleFrom(
                      minimumSize: const Size(double.infinity, 48),
                    ),
                    child: store.isSending
                        ? const SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : const Text('Отправить'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

