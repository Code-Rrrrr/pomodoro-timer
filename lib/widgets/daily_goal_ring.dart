import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/daily_goal_provider.dart';


class DailyGoalRing extends StatelessWidget {
  const DailyGoalRing({super.key});

  @override
  Widget build(BuildContext context) {
    final goalProvider = context.watch<DailyGoalProvider>();
    final goal = goalProvider.dailyGoal;

    return Column(
      children: [
        SizedBox(
          width: 140,
          height: 140,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircularProgressIndicator(
                value: goal.progress,
                strokeWidth: 10,
                backgroundColor: Colors.grey.shade300,
                valueColor: AlwaysStoppedAnimation(
                  goal.progress == 1.0
                      ? Colors.green
                      : Theme.of(context).primaryColor,
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${goal.completed} / ${goal.goal}',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const Text('Today'),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
