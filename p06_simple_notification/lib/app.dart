import 'package:flutter/material.dart';
//import 'package:flutter_notifications/services/firebase_messaging_service.dart';
//import 'package:flutter_notifications/services/notification_service.dart';
import 'package:p06_simple_notification/routes.dart';
//import 'package:provider/provider.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}
class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Treino de notificação',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: Routes.list,
      initialRoute: Routes.initial,
      navigatorKey: Routes.navigatorKey,
    );
  }
}