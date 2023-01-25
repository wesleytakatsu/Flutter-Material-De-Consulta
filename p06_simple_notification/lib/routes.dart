import 'package:flutter/material.dart';
import 'package:p06_simple_notification/pages/home_page.dart';
import 'package:p06_simple_notification/pages/notificacao_page.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> list = <String, WidgetBuilder>{
    '/home': (_) => const HomePage(),
    '/notificacao': (_) => const NotificacaoPage(),
  };

  static String initial = '/home';

  static GlobalKey<NavigatorState>? navigatorKey = GlobalKey<NavigatorState>();
}