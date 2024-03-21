import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final title = Provider<String>((ref) => "Simple Counter");
final counter = StateProvider<int>((ref) => 0);

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Riverpod Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const Counterpage(),
    );
  }
}

class Counterpage extends ConsumerWidget {
  const Counterpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final titleText = ref.watch(title);
    final counterProvider = ref.watch(counter);

    return Scaffold(
        backgroundColor: Colors.lightBlue,
        appBar: AppBar(
          title: const Text("RiverPod Example App"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 30),
                child: Text(titleText,
                    style: const TextStyle(color: Colors.white, fontSize: 30)),
              ),
              Text(
                counterProvider.toString(),
                style: const TextStyle(
                    color: Colors.white, height: 5, fontSize: 23),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.add),
                      label: const Text('Add'),
                      onPressed: () => ref.watch(counter.notifier).state++,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.remove),
                      label: const Text('Minus'),
                      onPressed: () => ref.watch(counter.notifier).state--,
                    ),
                  ),
                ],
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.replay),
                label: const Text('Refresh'),
                onPressed: () => ref.watch(counter.notifier).state = 0,
              ),
            ],
          ),
        ));
  }
}
