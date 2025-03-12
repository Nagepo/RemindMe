// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:flutter/material.dart';

class Reminder {
  String message;
  int times;
  IconData icon;

  Reminder({
    required this.message,
    this.times = 1,
    this.icon = Icons.notification_add,
  });

  Reminder copyWith({String? message, int? times, IconData? icon}) {
    return Reminder(
      message: message ?? this.message,
      times: times ?? this.times,
      icon: icon ?? this.icon,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message': message,
      'times': times,
      'icon': icon.codePoint,
    };
  }

  factory Reminder.fromMap(Map<String, dynamic> map) {
    return Reminder(
      message: map['message'] as String,
      times: map['times'] as int,
      icon: IconData(map['icon'] as int, fontFamily: 'MaterialIcons'),
    );
  }

  String toJson() => json.encode(toMap());

  factory Reminder.fromJson(String source) =>
      Reminder.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Reminder(message: $message, times: $times, icon: $icon)';

  @override
  bool operator ==(covariant Reminder other) {
    if (identical(this, other)) return true;

    return other.message == message &&
        other.times == times &&
        other.icon == icon;
  }

  @override
  int get hashCode => message.hashCode ^ times.hashCode ^ icon.hashCode;
}
