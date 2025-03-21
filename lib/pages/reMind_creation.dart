import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:remind_me/riverpod/riverpod.dart';

class SetRem extends ConsumerWidget {
  const SetRem({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Remind Me",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          children: [
            Text("Insert the text of the notification:"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: textController,
                decoration: const InputDecoration(
                  hintText: 'Enter the message',
                  border: OutlineInputBorder(),
                ),
                //onChanged: (value) => ref.read(remProvider).changeMessage(value),
              ),
            ),
            SizedBox(height: 50),
            Text(
              "Choose how many times to display in a day:",
              //The code below shows the choice taken, but gives problem with
              //the textController
              //${ref.watch(remProvider).info["times"].toString()}
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    ref.read(remProvider).changeTimes("1");
                  },
                  child: Text("1"),
                ),
                TextButton(
                  onPressed: () {
                    ref.read(remProvider).changeTimes("2");
                  },
                  child: Text("2"),
                ),
                TextButton(
                  onPressed: () {
                    ref.read(remProvider).changeTimes("3");
                  },
                  child: Text("3"),
                ),
              ],
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Choose the icon for the notification:"),
                //The code below shows the choice taken, but gives problem with
                //the textController
                //Icon(ref.watch(remProvider).info["icon"]),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    ref.read(remProvider).changeIcon(Icons.notifications);
                  },
                  icon: Icon(Icons.notifications),
                ),
                IconButton(
                  onPressed: () {
                    ref.read(remProvider).changeIcon(Icons.message);
                  },
                  icon: Icon(Icons.message),
                ),
                IconButton(
                  onPressed: () {
                    ref.read(remProvider).changeIcon(Icons.book);
                  },
                  icon: Icon(Icons.book),
                ),
                IconButton(
                  onPressed: () {
                    ref.read(remProvider).changeIcon(Icons.call);
                  },
                  icon: Icon(Icons.call),
                ),
              ],
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                ref.read(remProvider).changeMessage(textController.text);
                ref.read(remProvider).aad();
                textController.clear();
                ref.read(remProvider).reset();
                Navigator.of(context).pop();
              },
              child: Text("Add reminder"),
            ),
          ],
        ),
      ),
    );
  }
}
