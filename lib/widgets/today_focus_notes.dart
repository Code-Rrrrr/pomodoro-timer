import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/focus_notes_provider.dart';

class TodayFocusNotes extends StatelessWidget {
  const TodayFocusNotes({super.key});

  @override
  Widget build(BuildContext context) {
    final notes = context.watch<FocusNotesProvider>().todayNotes;

    if (notes.isEmpty) {
      return const Text('No focus notes today.');
    }

    return ListView.builder(
      shrinkWrap: true,
      itemCount: notes.length,
      itemBuilder: (_, i) {
        final n = notes[i];
        return ListTile(
          leading: const Icon(Icons.check_circle_outline),
          title: Text(n.text),
          subtitle: Text(
            '${n.time.hour.toString().padLeft(2, '0')}:${n.time.minute.toString().padLeft(2, '0')}',
          ),
        );
      },
    );
  }
}
