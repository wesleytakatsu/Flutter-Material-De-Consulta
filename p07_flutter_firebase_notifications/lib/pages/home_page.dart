import 'package:flutter/material.dart';
import 'package:p07_flutter_firebase_notifications/services/notification_service.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool valor = false;

  showNotification() {
    setState(() {
      valor = !valor;
      if (valor) {
        Provider.of<NotificationService>(context, listen: false).showLocalNotification(
          CustomNotification(
            id: 1,
            title: 'Teste',
            body: 'Abrir o app na tela de notificação!',
            payload: '/notificacao',
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 59, 20),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Card(
            child: ListTile(
              title: const Text('Mostrar a notificação'),
              trailing: valor
                  ? Icon(Icons.check_box, color: Colors.amber.shade600)
                  : const Icon(Icons.check_box_outline_blank),
              onTap: showNotification,
            ),
          ),
        ),
      ),
    );
  }
}
