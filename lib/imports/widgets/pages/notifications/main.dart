import 'dart:convert';

// import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PagesNotificationWidget extends StatefulWidget {
  const PagesNotificationWidget({Key? key}) : super(key: key);

  @override
  State<PagesNotificationWidget> createState() =>
      PagesNotificationWidgetState();
}

class PagesNotificationWidgetState extends State<PagesNotificationWidget> {
  @override
  void initState() {
    getPermission();
    messageListener(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const NotificationPage();
    // return FutureBuilder(
    //   // Initialize FlutterFire
    //   future: Firebase.initializeApp(),
    //   builder: (context, snapshot) {
    //     // Check for errors
    //     if (snapshot.hasError) {
    //       return Center(
    //         child: Text(snapshot.error.toString()),
    //       );
    //     }
    //     // Once complete, show your application
    //     if (snapshot.connectionState == ConnectionState.done) {
    //       if (kDebugMode) {
    //         print('android firebase initiated');
    //       }
    //       return const NotificationPage();
    //     }
    //     // Otherwise, show something whilst waiting for initialization to complete
    //     return const Center(
    //       child: CircularProgressIndicator(),
    //     );
    //   },
    // );
  }

  Future<void> getPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (kDebugMode) {
      print('User granted permission: ${settings.authorizationStatus}');
    }
  }

  void messageListener(BuildContext context) {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (kDebugMode) {
        print('Got a message whilst in the foreground!');
      }
      if (kDebugMode) {
        print('Message data: ${message.data}');
      }

      if (message.notification != null) {
        if (kDebugMode) {
          print(
              'Message also contained a notification: ${message.notification!.body}');
        }
        showDialog(
          context: context,
          builder: ((BuildContext context) {
            return DynamicDialog(
              title: message.notification!.title!,
              body: message.notification!.body!,
            );
          }),
        );
      }
    });
  }
}

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<StatefulWidget> createState() => _Application();
}

class _Application extends State<NotificationPage> {
  late String? _token;
  late Stream<String>? _tokenStream;
  int notificationCount = 0;

  void setToken(String? token) {
    if (kDebugMode) {
      print('FCM TokenToken: $token');
    }
    setState(() {
      _token = token;
    });
  }

  @override
  void initState() {
    super.initState();
    //get token
    FirebaseMessaging.instance.getToken().then(setToken);
    _tokenStream = FirebaseMessaging.instance.onTokenRefresh;
    _tokenStream!.listen(setToken);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: const EdgeInsets.all(10),
        elevation: 10,
        child: ListTile(
          title: Center(
            child: OutlinedButton.icon(
              label: const Text('Push Notification',
                  style: TextStyle(
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 16)),
              onPressed: () {
                sendPushMessageToWeb();
              },
              icon: const Icon(Icons.notifications),
            ),
          ),
        ),
      ),
    );
  }

  //send notification
  sendPushMessageToWeb() async {
    if (_token == null) {
      if (kDebugMode) {
        print('Unable to send FCM message, no token exists.');
      }
      return;
    }
    try {
      await http
          .post(
        Uri.parse('https://fcm.googleapis.com/fcm/send'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'key=YOUR SERVER KEY'
        },
        body: json.encode({
          'to': _token,
          'message': {
            'token': _token,
          },
          "notification": {
            "title": "Push Notification",
            "body": "Firebase  push notification"
          }
        }),
      )
          .then((value) {
        if (kDebugMode) {
          print(value.body);
        }
      });
      if (kDebugMode) {
        print('FCM request for web sent!');
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}

//push notification dialog for foreground
class DynamicDialog extends StatefulWidget {
  final String title;
  final String body;
  const DynamicDialog({super.key, required this.title, required this.body});
  @override
  State<DynamicDialog> createState() => DynamicDialogState();
}

class DynamicDialogState extends State<DynamicDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      actions: <Widget>[
        OutlinedButton.icon(
            label: const Text('Close'),
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.close))
      ],
      content: Text(widget.body),
    );
  }
}
