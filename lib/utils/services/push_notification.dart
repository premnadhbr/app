import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseApi {
  //creating an instance of firebase messaging
  static final _firebaseMessaging = FirebaseMessaging.instance;
  //function to initialize notifications
  static Future<void> initNotifications() async {
    //request permission from the user
    await _firebaseMessaging.requestPermission();
    //then fetch FCM TOCKEN for the device
    final fCMTocken = await _firebaseMessaging.getToken();
    //print the tocken
    print('Tocken :$fCMTocken');
  }

}
