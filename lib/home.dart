import 'package:counter_app/logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'providers.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int watchCounter = ref.watch(counter);
    var displayData = ref.watch(getUserDataProivder);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Counter App'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Text(
              'Your current count is: ' + watchCounter.toString(),
              style: const TextStyle(color: Colors.red, fontSize: 25),
            ),
            const SizedBox(
              height: 100,
            ),
            displayData.when(
                data: (value) {
                  return Text(
                    'Your previous count was : ' + value.toString(),
                    style: const TextStyle(color: Colors.green, fontSize: 25),
                  );
                },
                loading: () => const CircularProgressIndicator(),
                error: (e, stack) => Text('Error: $e')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counter.notifier).state++;
          FirebaseBackEnd.sendData(ref.read(counter));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
