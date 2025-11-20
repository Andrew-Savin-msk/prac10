import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:prac10/features/support/stores/support_screen_store.dart';
import 'package:prac10/features/support/services/support_service.dart';
import 'package:prac10/features/support/models/faq_item_model.dart';
import 'package:prac10/features/goals/app_router.dart';

class SupportScreen extends StatelessWidget {
  SupportScreen({super.key})
      : store = SupportScreenStore(GetIt.I<SupportService>());

  final SupportScreenStore store;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Поддержка и помощь'),
      ),
      body: Observer(
        builder: (_) {
          final faqItems = store.faqItems;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // FAQ блок
                const Text(
                  'FAQ',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                if (faqItems.isEmpty)
                  const Text(
                    'Вопросов пока нет.',
                    textAlign: TextAlign.left,
                  )
                else
                  _buildFaqSection(faqItems),
                const SizedBox(height: 24),

                // Блок "О приложении"
                const Text(
                  'О приложении',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                _buildAboutSection(context),
                const SizedBox(height: 24),

                // Кнопка/карточка обратной связи
                Card(
                  child: ListTile(
                    leading: const Icon(Icons.feedback),
                    title: const Text('Отправить отзыв'),
                    subtitle: const Text('Поделитесь идеями или сообщите о проблемах'),
                    onTap: () {
                      context.push(Routes.feedback);
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildFaqSection(List<FaqItem> items) {
    return ExpansionPanelList.radio(
      children: items
          .map(
            (item) => ExpansionPanelRadio(
              value: item.id,
              headerBuilder: (context, isExpanded) {
                return ListTile(
                  title: Text(item.question),
                );
              },
              body: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: Text(item.answer),
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _buildAboutSection(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.info_outline),
        title: const Text('О приложении'),
        subtitle: const Text('Версия, автор и краткое описание'),
        onTap: () {
          context.push(Routes.about);
        },
      ),
    );
  }
}

