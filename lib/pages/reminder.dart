// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

class Reminder {
  String message;
  String times;
  IconData icon;
  bool active;

  Reminder({
    required this.message,
    required this.times,
    required this.icon,
    this.active = true,
  });

  Reminder copyWith({
    String? message,
    String? times,
    IconData? icon,
    bool? active,
  }) {
    return Reminder(
      message: message ?? this.message,
      times: times ?? this.times,
      icon: icon ?? this.icon,
      active: active ?? this.active,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message': message,
      'times': times,
      'icon': icon.codePoint,
      'active': active,
    };
  }

  factory Reminder.fromMap(Map<String, dynamic> map) {
    return Reminder(
      message: map['message'] as String,
      times: map['times'] as String,
      icon: IconData(map['icon'] as int, fontFamily: 'MaterialIcons'),
      active: map['active'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Reminder.fromJson(String source) =>
      Reminder.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Reminder(message: $message, times: $times, icon: $icon, active: $active)';
  }

  @override
  bool operator ==(covariant Reminder other) {
    if (identical(this, other)) return true;

    return other.message == message &&
        other.times == times &&
        other.icon == icon &&
        other.active == active;
  }

  @override
  int get hashCode {
    return message.hashCode ^ times.hashCode ^ icon.hashCode ^ active.hashCode;
  }
}
