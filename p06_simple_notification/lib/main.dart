import 'package:flutter/material.dart';
import 'package:p06_simple_notification/app.dart';
import 'package:provider/provider.dart';
import 'package:p06_simple_notification/services/notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        Provider<NotificationService>(
          create: (context) => NotificationService(),
        ),
      ],
      child: const App(),
    ),
  );
}

