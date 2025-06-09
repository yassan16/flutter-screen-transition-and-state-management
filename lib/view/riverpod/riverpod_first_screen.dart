import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screen_transition_and_state_management/notifier_provider/future_sample_notifier.dart';
import 'package:flutter_screen_transition_and_state_management/notifier_provider/user_manager_notifier.dart';
import 'package:flutter_screen_transition_and_state_management/routes.dart';

class RiverpodFirstScreen extends ConsumerWidget {
  const RiverpodFirstScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(userManagerProvider);
    final futureSampleState = ref.watch(futureSampleNotifierProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('riverpod frist screen')),
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
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.riverpodSecond);
              },
              child: Text("riverpod second screenへ"),
            ),
            futureSampleState.when(
              data: (data) => Text(data),
              error: (error, stack) => Text("Error: $error"),
              loading: () => const CircularProgressIndicator(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // notiferProviderを試す
          ref.read(userManagerProvider.notifier).changeUser();
          print(
              "今のUser\nid: ${userState.getId}\npassword: ${userState.password}\nage: ${userState.getAge}");
          // asyncNotifierProviderを試す
          int i = await ref
              .read(futureSampleNotifierProvider.notifier)
              .updateState();
          print("戻り値${i}");
        },
        child: const Icon(Icons.check),
      ),
    );
  }
}
