import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:remind_me/pages/reminder.dart';
import 'package:remind_me/riverpod/riverpod.dart';

class RiverpodModel extends ChangeNotifier {
  List<SizedBox> reminders = [];
  Map info = {
    "message": "Just do it!",
    "times": "1",
    "icon": Icons.notifications,
    "active": true,
    "ref": WidgetRef,
  };

  void changeMessage(String message) {
    info["message"] = message;
    notifyListeners();
  }

  void changeTimes(String times) {
    info["times"] = times;
    notifyListeners();
  }

  void changeIcon(IconData icon) {
    info["icon"] = icon;
    notifyListeners();
  }

  void changeActive(bool x) {
    info["active"] = x;
    notifyListeners();
  }

  void aad() {
    reminders
        .add(create(info["message"], info["times"], info["icon"], info["ref"]));
  }

  SizedBox create(String message, String times, IconData icon, WidgetRef ref) {
    return SizedBox(
      height: 100,
      child: Card.outlined(
        color: Colors.grey.shade600,
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(flex: 2, child: Icon(icon)),
                  Expanded(flex: 4, child: Text(message)),
                  Expanded(child: Center(child: Text(times))),
                ],
              ),
            ),
            Expanded(
              child: Switch(
                value: ref.watch(remProvider).info["active"],
                onChanged: (bool newValue) {
                  ref.read(remProvider).changeActive(newValue);
                },
                activeColor: Colors.green,
                inactiveThumbColor: Colors.red,
                activeTrackColor: Colors.lightGreen,
                inactiveTrackColor: Colors.orange,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void reset() {
    info = {
      "message": "Just do it!",
      "times": "1",
      "icon": Icons.notifications,
      "active": true,
      "ref": WidgetRef,
    };
  }
}
