import 'package:flutter/material.dart';
import 'package:prac10/features/goals/models/goal_model.dart';
import 'package:prac10/features/goals/widgets/goal_card.dart';

class GoalsListView extends StatelessWidget {
  final List<Goal> goals;
  final Function(int) onDelete;
  final Function(Goal) onTap;

  const GoalsListView({
    super.key,
    required this.goals,
    required this.onDelete,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    if (goals.isEmpty) {
      return const Center(child: Text('Нет подходящих целей'));
    }

    return ListView.builder(
      itemCount: goals.length,
      itemBuilder: (context, index) {
        final goal = goals[index];
        return GoalCard(
          goal: goal,
          onDelete: () => onDelete(index),
          onTap: () => onTap(goal),
        );
      },
    );
  }
}
