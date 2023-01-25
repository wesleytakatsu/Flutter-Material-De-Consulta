import 'package:flutter/material.dart';
import 'package:p07_flutter_firebase_notifications/services/firebase_messaging_service.dart';
import 'package:p07_flutter_firebase_notifications/services/notification_service.dart';
import 'package:p07_flutter_firebase_notifications/routes.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
    initilizeFirebaseMessaging();
    checkNotifications();
  }

  initilizeFirebaseMessaging() async {
    await Provider.of<FirebaseMessagingService>(context, listen: false).initialize();
  }

  checkNotifications() async {
    await Provider.of<NotificationService>(context, listen: false).checkForNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Demonstração de notificação',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      routes: Routes.list,
      initialRoute: Routes.initial,
      navigatorKey: Routes.navigatorKey,
    );
  }
}
