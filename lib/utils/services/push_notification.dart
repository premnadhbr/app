import 'package:firebase_messaging/firebase_messaging.dart';
//firebase cloud messaging
class FirebaseApi {
  //creating an instance of firebase messaging
  static final _firebaseMessaging = FirebaseMessaging.instance;
  //function to initialize notifications
  static Future<void> initNotifications() async {
    //request permission from getting notification
    await _firebaseMessaging.requestPermission();
    //then fetch FCM TOCKEN for the device
    final fCMTocken = await _firebaseMessaging.getToken();
    //print the tocken
    print('Tocken :$fCMTocken');
  }

}
