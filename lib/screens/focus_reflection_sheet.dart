import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/focus_provider.dart';
import '../models/focus_session.dart';
import '../widgets/focus_rating_stars.dart';

class FocusReflectionSheet extends StatefulWidget {
  const FocusReflectionSheet({super.key});

  @override
  State<FocusReflectionSheet> createState() => _FocusReflectionSheetState();
}

class _FocusReflectionSheetState extends State<FocusReflectionSheet> {
  int rating = 3;
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("How focused were you?",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

          FocusRatingStars(
            selected: rating,
            onSelect: (val) => setState(() => rating = val),
          ),

          TextField(
            controller: controller,
            decoration: const InputDecoration(
              hintText: "Optional reflection (1 line is enough)",
            ),
          ),

          const SizedBox(height: 12),

          ElevatedButton(
            onPressed: () {
              context.read<FocusProvider>().addSession(
                FocusSession(
                  date: DateTime.now(),
                  rating: rating,
                  note: controller.text.isEmpty
                      ? null
                      : controller.text,
                ),
              );
              Navigator.pop(context);
            },
            child: const Text("Save Session"),
          ),
        ],
      ),
    );
  }
}
