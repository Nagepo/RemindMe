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
            Expanded(child: Icon(Icons.redo_outlined)),
            //Switch(value: true, onChanged: )
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
    };
  }
}
