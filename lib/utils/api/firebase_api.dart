import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  print('Title :${message.notification?.title}');
  print('Body :${message.notification?.body}');
  print('PayLoad :${message.data}');
}

void handleMessage(RemoteMessage? message) {
  if (message == null) {
    return null;
  } else {
    Navigator.push(navigationScree, route);
  }
}

class FirebaseApi {
  final firebasemessaging = FirebaseMessaging.instance;

  Future<void> initNotification() async {
    await firebasemessaging.requestPermission();
    final fcmTOKEN = await firebasemessaging.getToken();
    print('Token: $fcmTOKEN');
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }
}
