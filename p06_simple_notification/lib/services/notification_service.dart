//import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:p06_simple_notification/routes.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest_all.dart' as tz;

class CustomNotification {
  //  USAMOS SEMPRE ESSAS 4 PROPRIEDADES NAS NOTIFICAÇÕES
  final int id;
  final String title;
  final String body;
  final String? payload;
  //final RemoteMessage? remoteMessage;

  CustomNotification({
    required this.id,
    required this.title,
    required this.body,
    this.payload,
    //this.remoteMessage,
  });
}

class NotificationService {
  late FlutterLocalNotificationsPlugin localNotificationsPlugin;
  late AndroidNotificationDetails androidDetails;
  //  APENAS PARA ANDROID (DOCUMENTAÇÃO https://pub.dev/packages/flutter_local_notifications)


  NotificationService() {
    localNotificationsPlugin = FlutterLocalNotificationsPlugin();
    //_setupAndroidDetails();
    _setupNotifications();
  }

  
  _setupAndroidDetails() {
    androidDetails = const AndroidNotificationDetails(
      'lembretes_notifications_details',
      'Lembretes',
      channelDescription: 'Este canal é para lembretes!',
      importance: Importance.max,
      priority: Priority.max,
      enableVibration: true,
    );
  }
  

  _setupNotifications() async {
    await _setupTimezone();
    await _initializeNotifications();
  }

  Future<void> _setupTimezone() async {
    tz.initializeTimeZones();
    final String? timeZoneName = await FlutterNativeTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(timeZoneName!));
  }

  _initializeNotifications() async {
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    // Fazer: macOs, iOS, Linux...
    await localNotificationsPlugin.initialize(
      const InitializationSettings(
        android: android,
      ),
      onSelectNotification: _onSelectNotification,
    );
  }

  _onSelectNotification(String? payload) {
    if (payload != null && payload.isNotEmpty) {
      Navigator.of(Routes.navigatorKey!.currentContext!).pushNamed(payload);
      //  no pushNamed(payload) pode colocar direto o destino configurado nas rotas como pushNamed('/home_page.dart')
    }
  }

  //  NÃO USADO NO EXEMPLO DO FIREBASE COM FLUTTER
  showNotification(CustomNotification notification) {
    androidDetails = const AndroidNotificationDetails(
      'lembretes_notifications_x',
      'lembretes',
      channelDescription: 'Canal para lembretes',
      importance: Importance.max, //  O importance é quão acima a notificação ficará
      priority: Priority.max, //  Coloca a notificação em cima das de outros aplicativos
      enableVibration: true,  //  Vibra quando a notificação chega
      enableLights: false,  //  Pisca luses quando a notificação chega
    );

    localNotificationsPlugin.show(
      notification.id,
      notification.title,
      notification.body,
      NotificationDetails(
        android: androidDetails,
      ),
      //  aqui no payload que chama a notificação de fato
      payload: notification.payload,
    );
  }

/*
  showNotificationScheduled(CustomNotification notification, Duration duration) {
    final date = DateTime.now().add(duration);

    localNotificationsPlugin.zonedSchedule(
      notification.id,
      notification.title,
      notification.body,
      tz.TZDateTime.from(date, tz.local),
      NotificationDetails(
        android: androidDetails,
      ),
      payload: notification.payload,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
    );
  }
  */
  showLocalNotification(CustomNotification notification) {
    localNotificationsPlugin.show(
      notification.id,
      notification.title,
      notification.body,
      NotificationDetails(
        android: androidDetails,
      ),
      payload: notification.payload,
    );
  }

  

  //  Quando o aplicativo abrir precisa verificar se existe notificações
  checkForNotifications() async {
    final details = await localNotificationsPlugin.getNotificationAppLaunchDetails();
    if (details != null && details.didNotificationLaunchApp) {
      _onSelectNotification(details.payload);
    }
  }
  

}