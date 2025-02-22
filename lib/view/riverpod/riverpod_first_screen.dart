import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screen_transition_and_state_management/notifier_provider/user_manager_notifier.dart';

class RiverpodFirstScreen extends ConsumerWidget {
  const RiverpodFirstScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(userManagerProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('riverpod example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer(
              builder: (context, ref, _) {
                return Text(userState.getId);
              },
            ),
            Consumer(
              builder: (context, ref, _) {
                return Text(userState.password);
              },
            ),
            Consumer(
              builder: (context, ref, _) {
                return Text("${userState.getAge}");
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ref.read(userManagerProvider.notifier).changeUser(),
        child: const Icon(Icons.check),
      ),
    );
  }
}
