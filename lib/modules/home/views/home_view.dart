import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpoddemo/data/models/data_model.dart';
import 'package:riverpoddemo/providers/providers.dart';

class Home extends ConsumerWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final c = ref.watch(cc);
    ref.read(cc.notifier).mycounter();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text((c?.user)!),
            const SizedBox(
              height: 100,
            ),
            Text((c?.fakedatabase.toString())!),
            const SizedBox(
              height: 100,
            ),
            const Text('fake database counter'),
            const SizedBox(
              height: 100,
            ),
            TextButton(
                onPressed: () {
                  ref.read(cc.notifier).add(c!);
                },
                child: const Text('add')),
            const SizedBox(
              height: 100,
            ),
            TextButton(
                onPressed: () {
                  ref.read(cc.notifier).substract(c!);
                },
                child: const Text('substract')),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('riverpod simplified'),
      ),
    );
  }
}
