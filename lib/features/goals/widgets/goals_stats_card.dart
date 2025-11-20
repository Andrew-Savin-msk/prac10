import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:prac10/features/goals/services/goal_service.dart';
import 'package:prac10/features/goals/widgets/progress_text.dart';
import 'package:prac10/features/goals/stores/goals_list/goals_list_screen_store.dart';

class GoalsStatsCard extends StatelessWidget {
  final GoalsListScreenStore store;

  const GoalsStatsCard({super.key, required this.store});

  double _averageProgress() {
    final goals = GetIt.I<GoalService>().goals;
    if (goals.isEmpty) return 0;
    return goals.map((g) => g.progress).reduce((a, b) => a + b) / goals.length;
  }

  int _completedCount() => GetIt.I<GoalService>().goals.where((g) => g.isCompleted).length;

  int _totalCount() => GetIt.I<GoalService>().goals.length;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        final _ = store.refreshCounter;
        final totalCount = _totalCount();
        final completedCount = _completedCount();
        final averageProgress = _averageProgress();

    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(children: [
              Text(
                    '$totalCount',
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const Text('Всего целей'),
            ]),
            Column(children: [
              Text(
                    '$completedCount',
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const Text('Выполнено'),
            ]),
            Column(children: [
                  ProgressText(progress: averageProgress),
            ]),
          ],
        ),
      ),
        );
      },
    );
  }
}
