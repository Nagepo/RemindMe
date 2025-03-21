import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:remind_me/pages/reMind_creation.dart';
import 'package:remind_me/riverpod/riverpod.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey.shade400,
        textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.white)),
      ),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RemindMe", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: ref.watch(remProvider).reminders.isEmpty
            ? Center(child: const Text('There\'s no reminder active'))
            : SizedBox(
                height: MediaQuery.of(context).size.height * 0.92,
                child: ListView.builder(
                  itemCount: ref.watch(remProvider).reminders.length,
                  itemBuilder: (context, index) {
                    return ref.watch(remProvider).reminders[index];
                  },
                ),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SetRem()),
          );
        },
        tooltip: 'Add a reminder',
        child: const Icon(Icons.notification_add),
      ),
    );
  }
}
