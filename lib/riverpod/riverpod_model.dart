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

  void aad() {
    reminders.add(create(info["message"], info["times"], info["icon"]));
  }

  SizedBox create(String message, String times, IconData icon) {
    return SizedBox(
      height: 150,
      child: Card.outlined(
        color: Colors.grey.shade300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text(message), Text(times), Icon(icon)],
        ),
      ),
    );
  }

  void reset() {
    info = {"message": "Just do it!", "times": 1, "icon": Icons.notifications};
  }
}
