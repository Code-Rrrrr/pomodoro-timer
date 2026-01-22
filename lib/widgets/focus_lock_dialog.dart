// pomodoro screen
class _PomodoroScreenState extends State<PomodoroScreen>
    with WidgetsBindingObserver {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final lock = context.read<FocusLockProvider>();

    if (state == AppLifecycleState.paused &&
        lock.focusLockEnabled &&
        lock.sessionActive) {

      // 🔥 Session violated
      lock.endSession();
      context.read<AppProvider>().streakBroken = true;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Focus Lock violated. Session terminated."),
        ),
      );
    }
  }
}

// focus lock toggle
SwitchListTile(
title: const Text("Focus Lock"),
subtitle: const Text("Leaving the app ends the session"),
value: context.watch<FocusLockProvider>().focusLockEnabled,
onChanged: (value) {
context.read<FocusLockProvider>().toggleFocusLock(value);
},
)

// warning dialog
showDialog(
context: context,
builder: (_) => AlertDialog(
title: const Text("Focus Lock Enabled"),
content: const Text(
"Leaving the app will immediately end your session.\n\nNo mercy."
),
actions: [
TextButton(
onPressed: () => Navigator.pop(context),
child: const Text("I Understand"),
)
],
),
);
