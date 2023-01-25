import 'package:flutter/material.dart';
import 'package:p07_flutter_firebase_notifications/app.dart';
import 'package:p07_flutter_firebase_notifications/services/firebase_messaging_service.dart';
import 'package:p07_flutter_firebase_notifications/services/notification_service.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:p07_flutter_firebase_notifications/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
        Provider<NotificationService>(
          create: (context) => NotificationService(),
        ),
        Provider<FirebaseMessagingService>(
          create: (context) => FirebaseMessagingService(context.read<NotificationService>()),
        ),
      ],
      child: const App(),
    ),
  );
}
