import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import 'package:prac10/features/goals/app_router.dart';
import 'package:prac10/features/goals/widgets/goals_stats_card.dart';
import 'package:prac10/features/goals/widgets/goals_search_bar.dart';
import 'package:prac10/features/goals/widgets/goals_list_view.dart';
import 'package:prac10/features/goals/stores/goals_list/goals_list_screen_store.dart';
import 'package:prac10/features/goals/services/goal_service.dart';


class GoalsListScreen extends StatelessWidget {
  GoalsListScreen({super.key})
      : store = GoalsListScreenStore(GetIt.I<GoalService>()),
        _searchController = TextEditingController() {
    store.setSearchQuery('');
    store.refresh();
  }

  final GoalsListScreenStore store;
  final TextEditingController _searchController;

  void _addGoal(BuildContext context) {
    context.push(Routes.addGoal);
  }

  void _openCompleted(BuildContext context) {
    context.push(Routes.completed);
  }

  void _openAchievements(BuildContext context) {
    context.push(Routes.achievements);
  }

  void _openProfile(BuildContext context) {
    context.push(Routes.profile);
  }

  void _openActivityLog(BuildContext context) {
    context.push(Routes.activityLog);
  }

  void _openFocusSessions(BuildContext context) {
    context.push(Routes.focusSessions);
  }

  void _openTips(BuildContext context) {
    context.push(Routes.tips);
  }

  void _openSupport(BuildContext context) {
    context.push(Routes.support);
  }

  void _deleteGoal(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Удалить цель?'),
        content: const Text('Вы уверены, что хотите удалить эту цель?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Отмена'),
          ),
          FilledButton(
            onPressed: () {
              store.deleteByFilteredIndex(index);
              Navigator.pop(ctx);
            },
            child: const Text('Удалить'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Менеджер целей'),
        actions: [
          IconButton(
            tooltip: 'Поддержка',
            icon: const Icon(Icons.help_outline),
            onPressed: () => _openSupport(context),
          ),
          IconButton(
            tooltip: 'Советы и статьи',
            icon: const Icon(Icons.menu_book),
            onPressed: () => _openTips(context),
          ),
          IconButton(
            tooltip: 'Фокус-сессии',
            icon: const Icon(Icons.timer),
            onPressed: () => _openFocusSessions(context),
          ),
          IconButton(
            tooltip: 'Журнал действий',
            icon: const Icon(Icons.history),
            onPressed: () => _openActivityLog(context),
          ),
          IconButton(
            tooltip: 'Выполненные',
            icon: const Icon(Icons.done_all),
            onPressed: () => _openCompleted(context),
          ),
          IconButton(
            tooltip: 'Ачивки',
            icon: const Icon(Icons.emoji_events),
            onPressed: () => _openAchievements(context),
          ),
          IconButton(
            tooltip: 'Профиль',
            icon: const Icon(Icons.person),
            onPressed: () => _openProfile(context),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Observer(
          builder: (_) {
            final goals = store.goals;

            return Column(
              children: [
                GoalsStatsCard(store: store),
                GoalsSearchBar(
                  controller: _searchController,
                  onChanged: () {
                    store.setSearchQuery(_searchController.text);
                  },
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: goals.isEmpty
                      ? const Center(child: Text('Целей пока нет'))
                      : GoalsListView(
                    goals: goals,
                    store: store,
                    onDelete: (index) => _deleteGoal(context, index),
                    onTap: (goal) async {
                      await context.push(
                        Routes.goalDetail,
                        extra: goal,
                      );
                      store.refresh();
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _addGoal(context),
        label: const Text('Новая цель'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
