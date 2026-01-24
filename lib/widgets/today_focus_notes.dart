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

