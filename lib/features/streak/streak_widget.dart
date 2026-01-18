import 'package:flutter/material.dart';
import 'streak_service.dart';
import 'streak_model.dart';

class StreakWidget extends StatefulWidget {
  const StreakWidget({super.key});

  @override
  State<StreakWidget> createState() => _StreakWidgetState();
}

class _StreakWidgetState extends State<StreakWidget> {
  final _service = StreakService();
  StreakModel? _streak;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final streak = await _service.getStreak();
    setState(() => _streak = streak);
  }

  @override
  Widget build(BuildContext context) {
    if (_streak == null) return const SizedBox();

    return InkWell(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (_) => Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('🔥 Current Streak: ${_streak!.currentStreak}',
                    style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 12),
                Text('🏆 Best Streak: ${_streak!.bestStreak}',
                    style: Theme.of(context).textTheme.titleMedium),
              ],
            ),
          ),
        );
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('🔥'),
          const SizedBox(width: 6),
          Text('${_streak!.currentStreak}'),
        ],
      ),
    );
  }
}
