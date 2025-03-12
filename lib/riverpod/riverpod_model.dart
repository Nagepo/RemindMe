import 'package:flutter/material.dart';
import 'package:remind_me/pages/reminder.dart';

class RiverpodModel extends ChangeNotifier {
  List<SizedBox> reminders = [];
  Map info = {
    "message": "Just do it!",
    "times": "1",
    "icon": Icons.notifications,
  };

  void changeMessage(String message) {
    info["message"] = message;
  }

  void changeTimes(String times) {
    info["times"] = times;
  }

  void changeIcon(IconData icon) {
    info["icon"] = icon;
  }

  void aad() {
    reminders.add(create(info["message"], info["times"], info["icon"]));
  }

  SizedBox create(String message, int times, IconData icon) {
    return SizedBox(
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text(message), Text(times.toString()), Icon(icon)],
        ),
      ),
    );
  }

  void reset() {
    info = {"message": "Just do it!", "times": 1, "icon": Icons.notifications};
  }
}
